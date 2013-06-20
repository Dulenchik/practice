class CreateChairsUsers < ActiveRecord::Migration
  def change
    create_join_table :chairs, :users
  end
end
