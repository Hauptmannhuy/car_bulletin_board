
class Api::AnnouncementsController < Api::ApplicationController
  before_action :authenticate_api_user!, only: [:create, :index]
  def index
    @user = current_api_user
    if params.include?(:status)
      @announcments = @user.announcements.where(status: params[:status])
    else
      @announcments = @user.announcements
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
