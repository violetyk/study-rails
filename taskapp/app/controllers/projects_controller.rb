class ProjectsController < ApplicationController

  # 全部のメソッドに効かせる場合
  # before_action :set_project
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  
  def index
    @projects = Project.all

    # objectの中身を見る
    # p @projects.inspect
  end


  def show
    # @project = Project.find(params[:id])
    @project = Project.first
    # p @project.inspect
    # exit
  end


  def new
    @project = Project.new
  end

  def create
    permitted_params = project_params()
    # Rails.logger.error permitted_params

    @project = Project.new(permitted_params)
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end


  def edit
    # @project = Project.find(params[:id])
  end

  def update
    # @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end

  end

  def destroy
    # @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    # 外から受け取ったパラメータを許可しフィルタリングをしてあげる mass assignment対策
    # params[:project].permit(:title)
    # requireメソッドは、そのパラメータがないと例外をはくメソッド
    params.require(:project).permit(:title, :avatar)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
