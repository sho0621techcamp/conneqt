class TutorsController < ApplicationController
  def index
    @tutors = Tutor.all
  end

  def new
    @tutor = Tutor.new
  end

  def show
    @tutor = Tutor.find(params[:id])
  end

  def create
    @tutor = Tutor.create(tutor_params)
    if @tutor.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tutor_params
    params.require(:tutor).permit(:image, :tutor_name, :email, :password, :password_confirmation, :tutor_introduction, :github_account, { tag_ids: [] }).merge(tutor_id: current_tutor.id)
  end
end
