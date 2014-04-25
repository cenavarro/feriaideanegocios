ActiveAdmin.register_page 'conclude_phase' do
  menu label: 'Finalizar Fase 1'

  controller do
    def index
      @projects = Project.in_phase(1).sort{ |x, y| y.total_rating <=> x.total_rating }
    end

    def pass_projects
      projects = Project.where(id: selected_projects_ids)
      if projects.update_all(phase: 2)
        message = 'Proyectos se han movido a segunda fase'
      else
        message = 'Ha ocurrido un error al mover los proyectos a segunda fase'
      end
      redirect_to admin_conclude_phase_path, flash: { notice: message }
    end

    private
    def selected_projects_ids
      params[:projects].select {|k, v| v == "1" }.keys
    end
  end

  content title: 'Mover proyectos a fase 2' do
    form id: 'move_projects_form', action: admin_pass_projects_path, method: :post do
      input type: :hidden, name: request_forgery_protection_token.to_s, value: form_authenticity_token
      panel "Proyectos" do
        table_for projects do
          column '' do |project|
            check_box 'projects', project.id , checked: false
          end
          column 'Categoria', :category
          column 'Nombre', :name
          column 'Promedio Total', :total_rating
        end
      end
      input type: :submit, value: 'Mover a Fase 2'
    end
  end
end

