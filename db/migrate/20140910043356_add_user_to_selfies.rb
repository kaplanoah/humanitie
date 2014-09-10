class AddUserToSelfies < ActiveRecord::Migration
  def change
    add_reference :selfies, :user, index: true
  end
end
