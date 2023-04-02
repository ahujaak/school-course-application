class Course < ApplicationRecord
  belongs_to :school
  has_many :batches, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :school_id }
  validates :description, presence: true
end
