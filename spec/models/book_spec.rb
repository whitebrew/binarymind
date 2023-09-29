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
  describe "title" do
    it "should be present" do
      book = build(:book, title: nil)
      expect(book).to be_invalid
    end

    it "should be unique" do
      title = Faker::Book.title
      create(:book, title: title)
      book = build(:book, title: title)
      expect(book).to be_invalid
    end
  end

  describe "author" do
    it "should be present" do
      book = build(:book, author: nil)
      expect(book).to be_invalid
    end
  end

  describe "translator" do
    it "should be present" do
      book = build(:book, translator: nil)
      expect(book).to be_invalid
    end
  end

  describe "slug" do
    it "should be present" do
      book = build(:book)
      expect(book).to be_valid
    end

    it "should be parameterized from title" do
      book = create(:book, title: "The Great Gatsby")
      expect(book.slug).to eq("the-great-gatsby")
    end
  end

  describe "state" do
    it "should be present" do
      book = build(:book, state: nil)
      expect(book).to be_invalid
    end

    it "should be draft or published" do
      expect(Book.states).to include("draft", "published")
    end

    it "sets default value - draft" do
      book = create(:book)
      expect(book.state).to eq("draft")
    end
  end

  describe "in_a_nutshell" do
    it "should be present" do
      book = build(:book, in_a_nutshell: nil)
      expect(book).to be_invalid
    end
  end

  describe "description" do
    it "should be present" do
      book = build(:book, description: nil)
      expect(book).to be_invalid
    end
  end

  describe "published_on" do
    it "should be present" do
      book = build(:book, published_on: nil)
      expect(book).to be_invalid
    end

    it "should be after first_published_on" do
      book = create(:book)
      expect(book.published_on).to be > book.first_published_on
    end
  end
end
