class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :logged_in_tutor, only: :edit
  include SessionsHelper

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduction, :github_account, :image, { tag_ids:[] }])
  end

  def logged_in_tutor
    redirect_to login_path unless logged_in?
  end

  def self.render_with_signed_in_user(user, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end

end
