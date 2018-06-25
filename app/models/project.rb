class Project < ApplicationRecord
  has_many :pictures

  def to_param
    get_url
  end

  def get_url
    if !url.present?
      update(url: squeeze_title)
    end
    return url
  end

  def squeeze_title
    title.gsub(/\s+/, "_").downcase
  end
end
