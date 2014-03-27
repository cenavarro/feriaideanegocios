class ProjectsController < ApplicationController
  def create
    if valid_period?
      save_project
    else
      render json: { errors: ['No estamos en periodo de recepcion de ideas.'] }, status: 500
    end
  end

  private
  def new_project_params
    params.require(:project).permit(
      :name,
      :category_id,
      :motivation,
      :description,
      :advantage,
      participants_attributes: [
        :name,
        :carnet,
        :career_id,
        :phone,
        :email
      ]
    )
  end

  def save_project
    project = Project.new(new_project_params.merge(phase: 1))
    if project.save
      render json: { message: "El proyecto fue ingresado correctamente!" }
    else
      render json: { errors: project.errors.full_messages }, status: 422
    end
  end

  def valid_period?
    FairPeriod.can_add_project?
  end
end

