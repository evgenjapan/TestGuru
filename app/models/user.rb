class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  scope :test_by_level, -> (level) { joins(:tests).where(tests:{level: level}) }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
