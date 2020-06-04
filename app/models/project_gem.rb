class ProjectGem < ApplicationRecord
  belongs_to :document

  validates :name, presence: true
end
