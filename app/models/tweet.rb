class Tweet < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 240, too_long: "A tweet length can't superior than %{count} characters !" }
  #default_scope -> {order(created_at: desc)} #newest tweet
end
