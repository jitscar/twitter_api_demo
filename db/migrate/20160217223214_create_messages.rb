class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user, index: true
      t.text :content, null: false, limit: 140
      t.boolean :like, default: false

      t.timestamps null: false
    end
  end
end
