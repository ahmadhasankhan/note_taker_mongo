class ApplicationController < ActionController::Base

  private
  def authorize
    redirect_to root_path, alert: 'You are not authorized!' unless @note.user == current_user
  end
end
