class Announcement < ApplicationRecord
  belongs_to :user
  before_create :set_pending_status

  def set_pending_status
    self.status = 'pending'
  end
end
