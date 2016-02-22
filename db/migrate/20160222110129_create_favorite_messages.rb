class CreateFavoriteMessages < ActiveRecord::Migration
  def change
    create_table :favorite_messages do |t|
      t.belongs_to :message, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
