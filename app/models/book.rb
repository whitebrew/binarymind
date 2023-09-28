# frozen_string_literal: true

class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum :state, %i[draft published].index_with(&:to_s), default: :draft
end
