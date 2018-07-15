class Shift < ApplicationRecord
  belongs_to :restaurant
  validates :name, presence: true, uniqueness: { scope: :restaurant_id }
  validates :from, presence: true, time: true
  validates :to, presence: true, time: true
  validates :restaurant_id, presence: true
  validate :from_earlier_than_to

  def from_earlier_than_to
    if Time.parse(from.to_s) > Time.parse(to.to_s)
      errors[:from] << '`From` should be before `to`'
    end
  rescue ArgumentError
    errors[:from] << 'Time is invalid'
  end
end
