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
class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum :state, %i[draft unpublished published].index_with(&:to_s), default: :draft

  validates :title, presence: true, uniqueness: true
  validates :author, :translator, :state, :in_a_nutshell, :description, :published_on,
    presence: true

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
