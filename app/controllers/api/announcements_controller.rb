class Api::AnnouncementsController < Api::ApplicationController
  def index
    if params.include?(:status)
      @announcments = Announcment.where(status: params[:status])
    else
      @announcments = Announcment.all
    end
     render json: @announcments
  end

  def create
    @announcment = Announcment.create!(permitted_params)
    render json: @announcment
  end
  protected
  def permitted_params
    params.require(:announcment).permit(:brand,:model,:car_body,:milleage,:color,:price,:fuel,:engine_capacity,:year,:mobile_number,:email)
  end
end
