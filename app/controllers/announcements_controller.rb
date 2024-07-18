class AnnouncementsController < ApplicationController
  def update
      Announcement.update(params[:id], :status => params[:status])
  end
end