class AddUrlColumnToProjectsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :url, :string
    add_index :projects, :url, unique: true
  end
end
