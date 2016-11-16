class Doctor < ApplicationRecord
  validates_presence_of :first_name, :last_name, :speciality

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  def doctor_full_name
    "#{first_name} #{last_name}"
  end
end
