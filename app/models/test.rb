class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User'
  has_many :questions

  validates :title, presence: true
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}, uniqueness: { scope: :title }

  default_scope { order(created_at: :desc) }

  scope :easy, -> { where(0..1) }
  scope :normal, -> { where(2..4) }
  scope :hard, -> { where(5..Float::INFINITY) }
  scope :get_category_by_name, -> (category_title) { joins(:category).where(categories: {title: category_title}) }

  def self.titles_by_category(category_title)
    get_category_by_name(category_title).order('tests.title DESC').pluck('tests.title')
  end
end
