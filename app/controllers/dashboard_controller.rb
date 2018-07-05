class DashboardController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to new_user_session_path and return
    end
  end
end
