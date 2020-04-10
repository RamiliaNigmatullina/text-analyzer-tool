FactoryBot.define do
  factory :template do
    text { Faker::Lorem.sentence }
    kind { %w[model field field_type].sample }
  end
end
