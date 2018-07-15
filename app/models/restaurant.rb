class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Invalid email format' }
  validates :phone, presence: true, uniqueness: true, format: { with: /\A\d*[\-\.]*\d{3}[\-\.]\d{3}[\-\.]\d{4}\z/, message: 'Invalid phone format' }
end
