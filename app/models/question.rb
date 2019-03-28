class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true
  validates :answers, length: { in: 0..4 }

end
