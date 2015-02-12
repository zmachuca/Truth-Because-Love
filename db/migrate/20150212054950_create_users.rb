class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country

      t.timestamps
    end
  end
end
