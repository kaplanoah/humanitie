class AddPictureToSelfies < ActiveRecord::Migration
  def change
    add_column :selfies, :picture, :string
  end
end
