class AddSelfiesToSelfiePairs < ActiveRecord::Migration
  def change
    add_reference :selfie_pairs, :earth_selfie, index: true
    add_reference :selfie_pairs, :space_selfie, index: true
  end
end
