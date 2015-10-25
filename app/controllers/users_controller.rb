class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users
  # GET /users.json
  def index
    redirect_to current_user
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user.role == 'Student'
      subject_ids = current_user.proficiencies.where("marks_in_perc < ?", 65).pluck(:subject_id)
      keywords = current_user.search_histories.order("hits DESC").limit(5).pluck(:keywords)
      @recommended_resources = Resource.includes([:subject, :tags]).where("subject_id IN (?)", subject_ids) + Resource.includes([:subject, :tags]).ransack(title_or_description_or_subject_title_or_tags_name_cont_any: keywords).result.limit(5)
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :name, :role)
  end
end
