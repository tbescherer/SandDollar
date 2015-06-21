class House < ActiveRecord::Base
  validates :owner_id, :address, presence: true
  validates :address, uniqueness: :true

  belongs_to :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id

  has_many :rental_requests,
    class_name: "HouseRentalRequest",
    foreign_key: :house_id,
    primary_key: :id

  has_many :renters, through: :rental_requests, source: :renter

  def belongs_to_user?(user)
    self.owner_id == user.id
  end
end
