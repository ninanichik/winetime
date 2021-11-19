class CreateUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.int :phone
      t.references :wines
    end
  end
end
