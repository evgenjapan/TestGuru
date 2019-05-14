class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'You dont have permission to view this' unless admin?
  end

  def admin?
    current_user.is_a? Admin
  end
end
