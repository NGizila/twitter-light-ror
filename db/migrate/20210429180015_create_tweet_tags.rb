class CreateTweetTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tweet_tags do |t|
      t.belongs_to :tweet, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
