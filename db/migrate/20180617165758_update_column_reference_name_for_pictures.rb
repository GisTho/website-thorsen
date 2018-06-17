class UpdateColumnReferenceNameForPictures < ActiveRecord::Migration[5.1]
  def change
    rename_column :pictures, :projects_id, :project_id
  end
end
