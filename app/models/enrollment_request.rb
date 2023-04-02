class EnrollmentRequest < ApplicationRecord
  belongs_to :batch
  belongs_to :student, -> { where "users.role = 2" }, class_name: "User", foreign_key: "student_id"
  belongs_to :approver, class_name: "User", foreign_key: "approved_by", optional: true

  validates :student_id, uniqueness: { scope: :batch_id, 
    message: "already exists for this batch"
  }

  enum status: { pending: 0, approved: 1, decline: 2 }

  def approve!(approved_by_id)
    self.update(status: 'approved', approved_by: approved_by_id, approved_at: Time.now)
  end
end
