class RemoveLikeFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :like
  end
end
