class AddingProjectsRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :source
    end

    create_table :pictures do |t|
      t.text :caption
      t.string :source

      t.references :projects, foreign_key: true
    end
  end
end
