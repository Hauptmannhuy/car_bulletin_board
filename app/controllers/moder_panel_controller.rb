class ModerPanelController < ApplicationController
  before_action :authenticate_admin!
  def show
    @announcements = Announcement.where(status: 'pending')
  end

end
