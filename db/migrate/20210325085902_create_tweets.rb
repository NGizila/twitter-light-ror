class CreateTweets < ActiveRecord::Migration[6.1]
  def change
	drop_table :tweets
    create_table :tweets do |t|
      t.string :content
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
