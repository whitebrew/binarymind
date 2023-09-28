# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    translator { Faker::Book.author }
    state { "draft" }
    in_a_nutshell { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    published_on { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    first_published_on { Faker::Date.between(from: 10.years.ago, to: 1.year.ago) }

    trait :published do
      state { :published }
    end

    trait :in_the_future do
      published_at { 2.days.from_now }
    end

    trait :in_the_past do
      published_at { 2.days.ago }
    end
  end
end
