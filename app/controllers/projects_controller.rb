class ProjectsController < ApplicationController
  #respond_to :html, :json

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

  def update
    project = Project.find_by(url: params[:id])

    respond_to do |format|
      if project.update_attributes(project_params)
        format.html { redirect_to(project, notice: 'Post was successfully updated.') }
        format.json { respond_with_bip(project) }
      else
        format.html { redirect_to :back }
        format.json { respond_with_bip(project) }
      end
    end
  end

  private

  def project_params
    params.require(:project).permit(:description)
  end
end
