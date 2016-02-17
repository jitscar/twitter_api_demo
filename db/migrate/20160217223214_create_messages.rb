class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.bool :like, default: false

      t.timestamps null: false
    end
  end
end
