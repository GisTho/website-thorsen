class UpdateColumnReferenceNameForTechSkills < ActiveRecord::Migration[5.1]
  def change
    rename_column :technical_skills, :skill_type_id, :technical_skill_type_id
  end
end
