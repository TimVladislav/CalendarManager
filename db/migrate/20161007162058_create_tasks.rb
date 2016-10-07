class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.datetime :dt
      t.string :owner

      t.timestamps null: false
    end
  end
end
