class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(url: params[:id])
    if !@project.present?
      redirect_back(fallback_location: projects_path)
      return
    end
  end
end
