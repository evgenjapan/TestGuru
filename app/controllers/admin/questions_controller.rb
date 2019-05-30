class Admin::QuestionsController < Admin::BaseController
  before_action :get_test, only: %i[index new create]
  before_action :get_question, only: %i[destroy show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit

  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path @question
    else
      render :edit
    end

  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_path @test
    else
      render :new
    end
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

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_from_not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
