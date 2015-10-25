class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show]

  # GET /resources
  # GET /resources.json
  def index
    @q = Resource.includes([:subject, :tags]).ransack(params[:q])
    @resources = @q.result
    keyword = params[:q][:title_or_description_or_subject_title_or_tags_name_cont].to_s if params[:q] and !params[:q][:title_or_description_or_subject_title_or_tags_name_cont].to_s.blank?
    current_user.save_history(keyword) if current_user.role == 'Student' and !@resources.blank? and !keyword.blank?
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Resource.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:resource).permit(:title, :description)
  end
end
