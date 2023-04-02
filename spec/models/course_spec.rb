# frozen_string_literal: true

require "rails_helper"

RSpec.describe Course, type: :model do
  context "Validations" do
    subject { create(:course) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  context "association" do
    it { should belong_to(:school) }
    it { should have_many(:batches) }
  end
end
