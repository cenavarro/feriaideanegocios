require 'feria/projects/factory'
class ProjectsController < ApplicationController
  def create
    if valid_period?
      save_project
    else
      render json: { errors: ['No estamos en periodo de recepcion de ideas.'] }, status: 500
    end
  end

  private
  def save_project
    project = Feria::Projects::Factory.new(params[:project]).build
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

