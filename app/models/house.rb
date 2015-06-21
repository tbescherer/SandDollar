class House < ActiveRecord::Base
  validates :owner_id, :address, presence: true
  validates :address, unique: :true

  belongs_to :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
end
