class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer  :commentable_id, null: false
      t.string   :commentable_type, null: false
      t.integer  :user_id, null: false
      t.string   :content, null: false, length: {maximum: 5000}

      t.timestamps(null: false)
    end
  end
end
