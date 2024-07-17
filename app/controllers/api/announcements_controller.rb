
class Api::AnnouncementsController < Api::ApplicationController
  before_action :authenticate_api_user!, only: [:create]
  def index
    if params.include?(:status)
      @announcments = Announcement.where(status: params[:status])
    else
      @announcments = Announcement.all
    end
     render json: @announcments
  end

  def create
    @user = current_api_user
    @announcment = @user.announcements.create!(permitted_params)
    render json: @announcment
  end


  protected
  def permitted_params
    params.require(:announcment).permit(:brand,:model,:car_body,:milleage,:color,:price,:fuel,:engine_capacity,:year,:mobile_number,:email)
  end
end
