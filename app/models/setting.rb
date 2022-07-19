class Setting < ApplicationRecord
  validates :user_id, uniqueness: true
  belongs_to :user
  
  validates :api, inclusion: { in: %w(mediastack currentsapi) }
  validates :api, presence: true
end