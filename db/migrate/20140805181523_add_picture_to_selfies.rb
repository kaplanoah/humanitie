class AddPictureToSelfies < ActiveRecord::Migration
  def change
    add_column :selfies, :image, :string
  end
end
