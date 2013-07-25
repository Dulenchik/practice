class CreateUserSessionTimetable < ActiveRecord::Migration
  def change
    create_table :user_session_timetable do |t|
      t.datetime :start
      t.datetime :end
      t.references :user, index: true
    end
  end
end
