class Keeper < User
  validates :club_id, presence: true
  belongs_to :club
  has_many :leagues
end
