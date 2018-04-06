class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_s
    try(:label) || try(:name) || try(:key) || super
  end
end
