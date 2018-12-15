class DescriptionsController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  before_action :authenticate_admin!, only: [:update]
  respond_to :html, :json, :js

  def update
    description = Description.find(params[:id])
    respond_to do |format|
      if (description.update_attributes(description_params))
        format.html { redirect_to(description, notice: 'Post was successfully updated.') }
        format.json { respond_with_bip(description) }
      else
        format.html { redirect_to :back }
        format.json { respond_with_bip(description) }
      end
    end
  end

  private

  def description_params
    params.require(:description).permit(:title, :data)
  end
end
