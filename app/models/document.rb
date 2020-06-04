class Document < ApplicationRecord
  extend Enumerize

  has_many :commands, dependent: :destroy
  has_many :entities, dependent: :destroy
  has_many :fields, through: :entities

  validates :name, :text, presence: true

  accepts_nested_attributes_for :entities

  enumerize :language, in: %w[English Russian]
end
