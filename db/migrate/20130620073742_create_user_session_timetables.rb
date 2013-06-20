class CreateUserSessionTimetables < ActiveRecord::Migration
  def change
    create_table :user_session_timetables do |t|
      t.datetime :start
      t.datetime :end
      t.references :user, index: true
    end
  end
end
