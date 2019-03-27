class Test < ApplicationRecord
  belongs_to :category
  has_many :users_tests
  has_many :users, through: :users_tests
  belongs_to :author, class_name: 'User'
  has_many :questions

  def self.titles_by_category(category_title)
    joins(:category).where(categories: {title: category_title}).order('tests.title DESC').pluck('tests.title')
  end
end
