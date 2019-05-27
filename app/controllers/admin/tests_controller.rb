class Admin::TestsController < Admin::BaseController

  before_action :get_test, only: %i[show destroy edit update start update_inline]
  before_action :set_tests, only: %i[index update_inline]
  skip_before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found

  def index
  end

  def destroy
    @test.destroy
    redirect_to action: :index
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  def new
    @test = Test.new
    @categories = Category.all
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path @question
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path @question
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def get_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_from_not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
