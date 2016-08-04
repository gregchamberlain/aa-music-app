class Track < ActiveRecord::Base
  validates :name, :lyrics, :kind, :album, presence: true
  validates :kind, inclusion: ["regular", "bonus"]
  belongs_to :album, dependent: :destroy
  has_one :band, through: :album
  has_many :notes
end
