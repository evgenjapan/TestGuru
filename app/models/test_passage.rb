class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  SUCCESS_SCORE = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def get_result
    (self.correct_questions/test.questions.count)*100
  end

  def test_passed?
    get_result >= SUCCESS_SCORE
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def current_progress
    (current_question_number - 1) / test.questions.count.to_f * 100
  end

  def time_up?
    test_finish_timer ? Time.current > test_finish_timer : false
  end

  def test_finish_timer
    created_at + test.timer.minutes if test.timer.present?
  end

  def timer_to_client
    test_finish_timer.to_f * 1000
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort unless answer_ids.nil?
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
