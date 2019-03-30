class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  scope :test_by_level, -> (level) { joins(:tests).where(tests:{level: level}) }
end
