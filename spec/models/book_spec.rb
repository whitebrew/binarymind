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
require "rails_helper"

RSpec.describe Book, type: :model do
  let!(:book) { create(:book) }

  it { expect(book.title).to be_present }
  it { expect(book.author).to be_present }
  it { expect(book.translator).to be_present }
  it { expect(book.state).to be_present }
  it { expect(book.slug).to be_present }
  it { expect(book.in_a_nutshell).to be_present }
  it { expect(book.description).to be_present }
  it { expect(book.published_on).to be_present }
  it { expect(book.first_published_on).to be_present }

  describe "slug" do
    it "should be unique" do
      book1 = create(:book, title: "The Great Gatsby")
      book2 = create(:book, title: "The Great Gatsby")
      expect(book1.slug).not_to eq(book2.slug)
    end

    it "should be parameterized from title" do
      book = create(:book, title: "The Great Gatsby")
      expect(book.slug).to eq("the-great-gatsby")
    end
  end

  describe "state" do
    it "should be draft or published" do
      book = create(:book)
      expect(book.state).to eq("draft")
      book.publish
      expect(book.state).to eq("published")
    end
  end

  describe "published_on" do
    it "should be after first_published_on" do
      book = create(:book)
      expect(book.published_on).to be > book.first_published_on
    end
  end
end
