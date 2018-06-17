class AddingAuthorRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
    end

    create_table :descriptions do |t|
      t.string :title
      t.text :data
      t.references :author, foreign_key: true
    end

    create_table :skill_types do |t|
      t.string :title
    end

    create_table :skills do |t|
      t.string :title
      t.references :skill_type, foreign_key: true
    end
  end
end
