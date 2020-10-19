class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [ :update, :destroy]

  def index
    render json: Project.all
  end

  def update
    if @project.update(project_params)
      render json: @project
    else
      render_error
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project
    else
      render_error
    end
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.permit(:name)
  end

  def render_error
    render json: { errors: @project.errors.full_messages },
           status: :unprocessable_entity
  end
end
