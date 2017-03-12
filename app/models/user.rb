class User < ApplicationRecord
  validates :team_id, :user_id, :webhook_url, presence: true
  validates :user_id, uniqueness: { scope: :team_id }

  def webhook_url
    webhook_data["url"]
  end
end
