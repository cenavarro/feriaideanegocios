ActiveAdmin.register_page "full reports" do
  menu false

  controller do
    def generate
      package = Axlsx::Package.new
      wb = package.workbook
      wb.add_worksheet(name: 'Proyectos') do |sheet|
        sheet.add_row []
        add_header(sheet)
        add_main_content(sheet)
      end
      send_data package.to_stream.read, type: 'application/xlsx', filename: filename
    end

    private
    def add_header(sheet)
      sheet.add_row [
        'Proyecto',
        'Categoria',
        'Descripción',
        'Motivación',
        'Ventajas',
        'Stand',
        'Participantes',
        'Carreras',
        'Telefonos',
        'Correos'
      ], :widths => [:ignore] * 9
    end

    def add_main_content(sheet)
      Project.current.each do |project|
        participants = project.participants
        sheet.add_row [
          project.name,
          project.category.name,
          project.description,
          project.motivation,
          project.advantage,
          project.stand,
          participants.first.name,
          participants.first.career.name,
          participants.first.phone,
          participants.first.email
        ], :widths => [:ignore] * 9
        if participants[1..-1].size > 0
          participants[1..-1].each do |part|
            sheet.add_row ['', '', '', '', '', part.name, part.career.name, part.phone, part.email], :widths => [:ignore] * 9
          end
        end
      end
    end

    def filename
      time = Time.now
      "Proyectos-#{time.strftime("%d-%m-%Y%l:%M:%S%P")}.xlsx"
    end
  end
end
