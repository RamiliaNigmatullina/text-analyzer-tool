class Document < ApplicationRecord
  extend Enumerize

  has_many :commands, dependent: :destroy
  has_many :entities, dependent: :destroy

  validates :name, :text, presence: true

  accepts_nested_attributes_for :entities

  enumerize :language, in: %w[English Russian]
end
