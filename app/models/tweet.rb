class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { maximum: 240, too_long: "A tweet length can't superior than %{count} characters !" }
end
