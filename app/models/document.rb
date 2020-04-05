class Document < ApplicationRecord
  has_many :commands, dependent: :destroy

  validates :name, :text, presence: true
end
