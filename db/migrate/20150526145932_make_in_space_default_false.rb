class MakeInSpaceDefaultFalse < ActiveRecord::Migration
  def change
    change_column :selfies, :in_space, :boolean, :default => false
  end
end
