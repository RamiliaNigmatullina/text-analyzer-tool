class Document < ApplicationRecord
  extend Enumerize

  has_many :commands, dependent: :destroy
  has_many :entities, dependent: :destroy
  has_many :project_gems, dependent: :destroy

  validates :name, :text, presence: true

  accepts_nested_attributes_for :entities
  accepts_nested_attributes_for :project_gems

  enumerize :language, in: %w[English Russian]
end
