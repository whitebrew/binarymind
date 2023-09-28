# frozen_string_literal: true

class Book < ApplicationRecord
  enum :state, %i[draft published].index_with(&:to_s), default: :draft
end
