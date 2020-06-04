class Entity < ApplicationRecord
  belongs_to :document

  has_many :fields, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :fields, allow_destroy: true
end
