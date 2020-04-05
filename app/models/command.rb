class Command < ApplicationRecord
  belongs_to :document

  validates :text, :position, presence: true
end
