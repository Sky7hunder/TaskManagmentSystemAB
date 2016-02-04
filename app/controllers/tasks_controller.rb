class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    tasks = current_user.tasks
    @uncompleted_tasks = tasks.order("#{sort_column} #{sort_direction}").where(completed: false)
    @completed_tasks = tasks.where(completed: true)
    @params = params
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    task_params[:due_date] = task_params[:due_date].to_time.strftime("%d/%m/%Y") if task_params[:due_date].present?
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  def completed_task
    @completed_task = Task.find(params[:id])
    @completed_task.completed ^= true
    @completed_task.save
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  def destroy_multiple
    @destroy_tasks = params[:task_ids]
    Task.destroy(@destroy_tasks)
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :due_date)
  end

  def sortable_columns
    ['title']
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : 'title'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

end
