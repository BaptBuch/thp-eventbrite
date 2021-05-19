module EventsHelper

  def is_current_user_attendee
    @attendees = []
    @event.attendances.each do |attendance|
      if attendance.user_id == current_user.id
        return true
      end
    end
  end

end
