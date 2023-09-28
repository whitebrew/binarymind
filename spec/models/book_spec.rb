# frozen_string_literal: true

require "rails_helper"

RSpec.describe Book, type: :model do
  let!(:book) { create(:book) }

  it { expect(book.title).to be_present }
  it { expect(book.author).to be_present }
end
