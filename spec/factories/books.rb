# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id                 :bigint           not null, primary key
#  title              :string           default(""), not null
#  author             :string           default(""), not null
#  translator         :string           default(""), not null
#  state              :string           default("draft"), not null
#  slug               :string           default(""), not null
#  in_a_nutshell      :text             default(""), not null
#  description        :text             default(""), not null
#  published_on       :date             not null
#  first_published_on :date             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
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
