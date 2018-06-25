class PagesController < ApplicationController
  def home
  end

  def about
    @author = Author.find_by_id(1)
    if @author.present?
      @technical_skills = {}
      @soft_skills = {}

      @author.technical_skills.try(:each) do |skill|
        if @technical_skills[skill.technical_skill_type].nil?
          @technical_skills[skill.technical_skill_type] = []
        end

        @technical_skills[skill.technical_skill_type].push(skill)
      end

      @author.soft_skills.try(:each) do |skill|
        if @soft_skills[skill.soft_skill_type].nil?
          @soft_skills[skill.soft_skill_type] = []
        end

        @soft_skills[skill.soft_skill_type].push(skill)
      end

      @technical_skills = @technical_skills.sort.to_h
      @soft_skills = @soft_skills.sort.to_h
    end
  end
end
