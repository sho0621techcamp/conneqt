class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :logged_in_tutor, only: [:edit, :update,]
  include SessionsHelper


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduction, :github_account, :image, :tag_ids])
  end

  def logged_in_tutor
    unless logged_in?
      redirect_to login_path
    end
  end
end
