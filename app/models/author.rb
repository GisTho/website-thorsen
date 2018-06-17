class Author < ApplicationRecord
  has_one :description

  def skills
    return Skill.all
  end
end
