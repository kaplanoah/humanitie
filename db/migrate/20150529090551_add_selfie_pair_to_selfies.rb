class AddSelfiePairToSelfies < ActiveRecord::Migration
  def change
    add_reference :selfies, :selfie_pair, index: true
  end
end