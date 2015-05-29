class AddUserToSelfiePairs < ActiveRecord::Migration
  def change
    add_reference :selfie_pairs, :user, index: true
  end
end