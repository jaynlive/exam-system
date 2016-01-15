class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators,options:"charset=utf8" do |t|
      t.string :username
      t.string :hashed_password
      t.string :salt
      t.boolean :is_admin,default: false

      t.timestamps
    end
  end
end
