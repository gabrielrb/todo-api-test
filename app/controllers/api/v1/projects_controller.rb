class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    render json: { projects: Project.all.order(id: :asc) }
  end

  def show
    render json: { project: @project }
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: :created
    else
      render_error
    end
  end

  def update
    if @project.update(project_params)
      render json: { project: @project }
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
