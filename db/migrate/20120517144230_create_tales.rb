class CreateTales < ActiveRecord::Migration
  def change
    create_table :tales do |t|
      t.text :content
      t.string :description
      t.integer :user_id
      t.boolean :main

      t.timestamps
    end
  end
end
