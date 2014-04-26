ActiveAdmin.register_page 'ratings_phase_two' do
  menu label: 'Calificaciones Fase 2'

  controller do
    def index
      @projects = Project.in_phase(2).sort_by{ |x| [x.category_id, -x.total_rating] }
    end
  end

  content title: 'Calificaciones Fase 2' do
    panel "" do
      table_for projects do
        column 'Categoria', :category
        column 'Nombre' do |project|
          link_to project.name, admin_project_path(project)
        end
        column 'Promedio Total', :total_rating
      end
    end
  end
end

