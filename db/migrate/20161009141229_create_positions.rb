class CreatePositions < ActiveRecord::Migration
  def up
    create_table :positions do |t|
      t.integer :task_id
      t.integer :user_id
      t.boolean :isnew
      t.timestamps null: false
    end
    drop_table :tasks_users
  end
end
