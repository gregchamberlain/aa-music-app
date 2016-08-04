class Note < ActiveRecord::Base
  validates :body, :user, :track, presence: true

  belongs_to :track
  belongs_to :user
end
