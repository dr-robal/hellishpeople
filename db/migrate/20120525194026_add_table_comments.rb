class AddTableComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :user_id
      t.integer :tale_ids
      
      t.timestamps
    end
    
    add_index :comments, [:commentable_id, :commentable_type]
  end

  def down
  end
end
