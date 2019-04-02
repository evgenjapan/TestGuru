class QuestionsController < ApplicationController
  before_action :get_test, only: %i[index new create]
  before_action :get_question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
  end

  def create
    Question.create!(body: get_question_params[:body], test: @test)
    redirect_to action: :index
  end

  def destroy
    @question.destroy
    redirect_to action: :index
  end

  private

  def get_test
    @test = Test.find(params[:test_id])
  end

  def get_question
    @question = Question.find(params[:id])
  end

  def get_question_params
    params.require(:question).permit(:body)
  end

  def rescue_from_not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
