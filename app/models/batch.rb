class Batch < ApplicationRecord
  belongs_to :course
  belongs_to :school

  has_many :enrollment_requests, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :course_id }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate  :validate_date_time

  private
    def validate_date_time
      return if start_time.blank? || end_time.blank?

      if start_time < Date.today
        errors.add(:start_time, "can't be in past" )
      elsif end_time < start_time
        errors.add(:end_time, "should be greater than start time" )
      end
    end
end
