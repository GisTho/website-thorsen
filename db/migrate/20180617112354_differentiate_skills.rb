class DifferentiateSkills < ActiveRecord::Migration[5.1]
  def change
    rename_table :skill_types, :technical_skill_types
    rename_table :skills, :technical_skills

    create_table :soft_skill_types do |t|
      t.string :title
    end

    create_table :soft_skills do |t|
      t.string :title
      t.references :soft_skill_type, foreign_key: true
    end
  end
end
