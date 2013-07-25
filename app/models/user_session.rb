class UserSession < ActiveRecord::Base
  self.table_name = "user_session_timetable"
  belongs_to :user
end
