class Test < ApplicationRecord
  belongs_to :category

  def self.titles_by_category(category_title)
    Category.find_by_title(category_title).order(title: :desc).pluck(:title)
  end
end
