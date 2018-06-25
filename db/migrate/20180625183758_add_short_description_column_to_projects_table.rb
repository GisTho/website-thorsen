class AddShortDescriptionColumnToProjectsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :short_description, :string
  end
end
