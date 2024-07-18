class ModerPanelController < ApplicationController
  def show
    @announcements = Announcement.where(status: 'pending')
  end

end
