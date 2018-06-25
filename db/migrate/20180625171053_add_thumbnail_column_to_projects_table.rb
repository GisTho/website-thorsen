class AddThumbnailColumnToProjectsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :thumbnail, :string
  end
end
