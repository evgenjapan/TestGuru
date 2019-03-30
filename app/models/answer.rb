class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:answers, 'Too answers, max value is 4') if question.answers.count >= 4
  end

end
