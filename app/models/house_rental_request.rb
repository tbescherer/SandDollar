class HouseRentalRequest < ActiveRecord::Base
  validates :user_id, :house_id, :start_date, :end_date, presence: true

  belongs_to :house,
    class_name: "House",
    foreign_key: :house_id,
    primary_key: :id

  belongs_to :renter,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
end
