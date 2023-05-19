class CreateUsersHospitalsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :hospitals do |t|
      t.index :hospital_id
      t.index :user_id
      t.string :role
    end
  end
end
