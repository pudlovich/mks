class Parcel < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :sender_info
  belongs_to :recipient_info

  accepts_nested_attributes_for :sender_info
  accepts_nested_attributes_for :recipient_info

  attr_localized :price, :weight

  validates :width, :height, :depth, :weight, :price, :parcel_number, :sender_info, :recipient_info, presence: true
  validates :weight, :price, numericality: { greater_than: 0 }
  validates :height, :depth, :width, numericality: { only_integer: true, greater_than: 0 }
  validates :parcel_number, uniqueness: true

  before_validation :set_price, :generate_parcel_number, on: :create

  private

  def set_price
    # dummy pricing function, to be substituted by actual business logic
    self.price = 10
  end

  def generate_parcel_number
    # returns a nine-digit parcel number - eight random digits and check digit generated using Luhn algorithm
    self.parcel_number = loop do
      number = SecureRandom.random_number(90000000)+10000000
      parcel_number = number.to_s + Luhn.control_digit(number).to_s
      break parcel_number unless Parcel.exists?(parcel_number: parcel_number)
    end
  end
end
