class Field < ApplicationRecord
  extend Enumerize

  belongs_to :entity

  validates :name, :kind, presence: true

  enumerize :kind, in: %w[boolean date datetime decimal float integer bigint string text jsonb]
end
