class Note < ActiveRecord::Base
  validates :body, :user, :track, presence: true

  belongs_to :track, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
