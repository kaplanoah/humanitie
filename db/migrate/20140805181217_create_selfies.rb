class CreateSelfies < ActiveRecord::Migration
  def change
    create_table :selfies do |t|
      t.string :name
      t.boolean :in_space

      t.timestamps
    end
  end
end
