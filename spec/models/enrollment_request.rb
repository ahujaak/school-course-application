# frozen_string_literal: true

require "rails_helper"

RSpec.describe EnrollmentRequest, type: :model do
  context "Validations" do
    subject { create(:enrollment_request) }
    it { should validate_uniqueness_of(:student_id).scoped_to(:batch_id).with_message("already exists for this batch") }
  end

  context "association" do
    it { should belong_to(:batch) }
    it { should belong_to(:student) }
    it { should belong_to(:approver).class_name('User').with_foreign_key('approved_by').optional(true) }
  end
end
