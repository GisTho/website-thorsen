class Author < ApplicationRecord
  has_one :description

  def technical_skills
    return TechnicalSkill.all
  end

  def soft_skills
    return SoftSkill.all
  end
end
