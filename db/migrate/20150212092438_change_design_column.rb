class ChangeDesignColumn < ActiveRecord::Migration
  def change
  	change_column :users, :design, :integer
  end
end
