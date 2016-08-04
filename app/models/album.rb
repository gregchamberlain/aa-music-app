class Album < ActiveRecord::Base
  validates :name, :kind, :band, presence: true
  validates :kind, inclusion: ["studio", "live"]

  belongs_to :band, dependent: :destroy
  has_many :tracks
end
