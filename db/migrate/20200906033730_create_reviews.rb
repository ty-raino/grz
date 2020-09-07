class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string  :game_title
      t.string  :body
      t.string  :upvotes

      t.timestamps
    end
  end
end
