ActiveAdmin.register Project, as: 'proyectos' do
  menu parent: "Reportes", label: "Completo"
  scope :current, default: true

  Project.old.pluck(:created_at).map(&:year).uniq.each do |year|
    scope(year.to_s) { |scope| scope.where('extract(year from created_at) = ?', year) }
  end

  xlsx do
    delete_columns :id, :name, :stand, :motivation, :description, :advantage, :code, :created_at, :updated_at, :motivated, :phase
    # 'Proyecto', 'Descripcion', 'Motivacion', 'Ventajas', 'Stand',  'Participantes', 'Carreras', 'Telefonos', 'Correos'
    sheet.add_row []
    sheet.add_row [
      'Proyecto',
      'Descripción',
      'Motivación',
      'Ventajas',
      'Stand',
      'Participantes',
      'Carreras',
      'Telefonos',
      'Correos'
    ], :widths => [:ignore] * 9
    Project.current.each do |project|
      participants = project.participants
      sheet.add_row [
        project.name,
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

  index do
    column :name
    column :description
    column :stand
    column "Participantes" do |project|
      project.participants.map { |p| p.name }.join('</br>').html_safe
    end
    column "Carreras" do |project|
      project.participants.map { |p| p.career.name }.join('</br>').html_safe
    end
    column "Telefonos" do |project|
      project.participants.map { |p| p.phone }.join('</br>').html_safe
    end
    column "Emails" do |project|
      project.participants.map { |p| p.email }.join('</br>').html_safe
    end
  end
end
