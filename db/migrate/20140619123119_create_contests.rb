class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.integer :exam_id
      t.integer :user_id
      t.integer :mark

      t.timestamps
    end
    add_index :contests, :exam_id
    add_index :contests, :user_id
  end
end
