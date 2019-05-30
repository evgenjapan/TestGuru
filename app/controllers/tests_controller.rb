class TestsController < ApplicationController
  before_action :get_test, only: %i[show destroy edit update start]

  skip_before_action :authenticate_user!, except: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def get_test
    @test = Test.find(params[:id])
  end

  def rescue_from_not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
