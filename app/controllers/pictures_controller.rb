class PicturesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update]
  before_action :authenticate_admin!, only: [:new, :update]
  respond_to :html, :json, :js

  def new
    project = Project.find_by(url: params[:id])
    edit_project_path(project)
  end

  def update
    picture = Picture.find(params[:id])
    project = picture.project

    respond_to do |format|
      if (picture.update_attributes(picture_params))
        format.html { redirect_to(picture, notice: 'Post was successfully updated.') }
        format.json { respond_with_bip(picture) }
      else
        format.html { redirect_to :back }
        format.json { respond_with_bip(picture) }
      end
    end
  end

  def picture_params
    params.require(:picture).permit(:caption, :source)
  end
end
