class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  BACKGROUND_DEFAULT = "#18111d"
end
