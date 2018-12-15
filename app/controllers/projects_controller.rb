class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :add_picture]
  before_action :authenticate_admin!, only: [:create, :update, :add_picture]
  skip_before_action :verify_authenticity_token, only: [:create]
  respond_to :html, :json, :js

  def index
    @projects = Project.all
  end

  def create
    project = Project.create()
    project.title = "New Project #{project.id}"
    project.save
    redirect_to edit_project_path(project)
  end

  def new
  end

  def show
    @project = Project.find_by(url: params[:id])
    if !@project.present?
      redirect_back(fallback_location: projects_path)
      return
    end
  end

  def update
    project = Project.find_by(url: params[:id])
    respond_to do |format|
      if (project.update_attributes(project_params))
        format.html { redirect_to(project, notice: 'Post was successfully updated.') }
        format.json { respond_with_bip(project) }
      else
        format.html { redirect_to :back }
        format.json { respond_with_bip(project) }
      end
    end
  end

  def edit
    if params.key?(:id)
      @project = Project.find_by(url: params[:id])
    end

    if params.key?(:picture_carousel)
    end
  end

  def add_picture
    project = Project.find_by(url: params[:project_id])
    picture = Picture.new(:project_id => project.id, :source => "www.google.com")
    picture.save
    redirect_to "/projects/#{project.url}/edit#Carousel-Pictures"
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :url, :short_description, :thumbnail, :source, :pictures, :hidden)
  end
end
