FactoryBot.define do
  factory :template do
    text { Faker::Lorem.sentence }
    type { %w[model].sample }
  end
end
