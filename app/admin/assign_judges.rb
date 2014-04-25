ActiveAdmin.register_page "assign projects" do
  menu false

  controller do
    def index
      @judges_in_phase = Judge.in_phase(params[:phase])
      if params[:id]
        @judge = @judges_in_phase.find(params[:id])
        @judge_projects = @judge.projects
      end
    end

    def assign
      @judge = Judge.in_phase(params[:phase]).find(params[:judge_id])
      @judge.add_projects selected_projects_ids
      redirect_to admin_assign_projects_path(phase: params[:phase], id: @judge.id), flash: { notice: "Proyectos actualizados correctamente!" }
    end

    private
    def selected_projects_ids
      params[:projects].select {|k, v| v == "1" }.keys
    end
  end

  content title: 'Asignar Proyectos' do
    input type: :hidden, id: 'phase', value: params[:phase]
    h3 "Seleccione el juez"
    select id: "select_judge" do
      option ""
      judges_in_phase.each do |judge_in_phase|
        option judge_in_phase.email, value: judge_in_phase.id
      end
    end

    if params[:id]
      br
      h2 "Juez: #{judge.email}"
      form action: assing_project_path, method: :post do
        input type: :hidden, name: 'phase', value: params[:phase]
        input type: :hidden, name: request_forgery_protection_token.to_s, value: form_authenticity_token
        input type: :hidden, name: 'judge_id', value: judge.id
        panel "Proyectos" do
          table_for Project.in_phase(params[:phase]).order('id ASC') do
            column "Asignado" do |project|
              check_box 'projects', project.id, checked: judge_projects.include?(project)
            end
            column "Proyecto" do |project|
              project.name
            end
            column "Categoria" do |project|
              project.category.name
            end
          end
        end
        input type: :submit, value: 'Guardar'
      end
    end
  end
end

