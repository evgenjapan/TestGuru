class User < ApplicationRecord
  VALID_EMAIL_PATTERN = /\A\w+@\w+\.\w+\z/

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable
         #:trackable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true, format: VALID_EMAIL_PATTERN, uniqueness: true

  scope :test_by_level, -> (level) { joins(:tests).where(tests:{level: level}) }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a? Admin
  end

end
