class House < ActiveRecord::Base
  validates :owner_id, :address, presence: true
  validates :address, uniqueness: :true

  belongs_to :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id

  def belongs_to_user?(user)
    self.owner_id == user.id
  end
end
