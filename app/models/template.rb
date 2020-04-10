class Template < ApplicationRecord
  extend Enumerize

  include PgSearch::Model

  validates :text, presence: true

  enumerize :kind, in: %w[model field field_type], predicates: true

  pg_search_scope :similarity_like,
    against: :text,
    using: {
      trigram: {
        threshold: 0.3
      }
    }
end
