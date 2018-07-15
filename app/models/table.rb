class Table < ApplicationRecord
  belongs_to :restaurant
  validates :name, presence: true, uniqueness: { scope: :restaurant_id }
  validates :min_guests, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :max_guests, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :restaurant_id, presence: true
  validate :max_greater_than_min

  private

  def max_greater_than_min
    if min_guests.to_i > max_guests.to_i
      errors[:max_guests] << 'Max guests count should be greater or equal to min guests count'
    end
  end
end
