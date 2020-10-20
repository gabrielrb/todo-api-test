class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  before_action :set_project, only: [:index, :create]

  def index
    render json: @project.tasks
  end

  def show
    render json: @task
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render_error
    end
  end

  def create
    @task = Task.new(task_params)
    @task.project = @project
    if @task.save
      render json: @task
    else
      render_error
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.permit(:date, :description, :status)
  end

  def render_error
    render json: { errors: @task.errors.full_messages },
           status: :unprocessable_entity
  end
end
