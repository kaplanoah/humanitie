class CreateSelfiePairs < ActiveRecord::Migration
  def change
    create_table :selfie_pairs do |t|

      t.timestamps
    end
  end
end
