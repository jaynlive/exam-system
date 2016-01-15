class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users,options:"charset=utf8" do |t|
      t.string :username,null:false #不允许为空
      t.string :name,null:false
      t.string :hashed_password
      t.integer :age,null:true
      t.boolean :sex,null:true
      t.string :school,null:true
      t.string :college,null:true
      t.string :profession,null:true
      t.string :work,null:false

      t.timestamps
    end
  end
end
