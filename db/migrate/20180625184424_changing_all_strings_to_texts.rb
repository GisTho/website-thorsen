# According to [https://code.i-harness.com/en/q/332eda] there is no performance penalty
# using text instead of varchar in Postgres. In other database types that is not the case.
#
# However, I am still only updating varchar instances that could be large to texts.

class ChangingAllStringsToTexts < ActiveRecord::Migration[5.1]
  def change
    change_column :pictures, :source, :text

    change_column :projects, :source, :text
    change_column :projects, :thumbnail, :text
    change_column :projects, :short_description, :text
  end
end
