class SessionsController < ApplicationController
  def new; end

  def create
    tutor = Tutor.find_by(email: params[:email].downcase)
    if tutor && tutor.authenticate(params[:password])
      log_in tutor
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:tutor_id)
    @current_tutor = nil
    redirect_to root_path
  end
end
