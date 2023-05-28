class Profile < ApplicationRecord
  validates :first_name, :last_name, :age, :phone_number, presence: true
  def full_name
    return first_name + last_name
  end
end
