class AddHidableFieldToProjects < ActiveRecord::Migration[5.1]
  # Sneaky change to using booleans as I forgot.
  def up
    add_column :projects, :hidden, :boolean, default: true
    execute "ALTER TABLE users ALTER COLUMN activated DROP DEFAULT;"
    execute "ALTER TABLE users ALTER COLUMN activated TYPE bool USING CASE WHEN activated='true' THEN TRUE ELSE FALSE END;"
    execute "ALTER TABLE users ALTER COLUMN activated SET DEFAULT FALSE;"
    execute "ALTER TABLE users ALTER COLUMN activated DROP NOT NULL;"
  end

  def down
    remove_column :projects, :hidden
    execute "ALTER TABLE users ALTER COLUMN activated DROP DEFAULT;"
    execute "ALTER TABLE users ALTER COLUMN activated TYPE varchar USING CASE WHEN activated=true THEN 'true' ELSE 'false' END;"
    execute "ALTER TABLE users ALTER COLUMN activated SET DEFAULT 'false';"
    execute "ALTER TABLE users ALTER COLUMN activated SET NOT NULL;"
  end
end
