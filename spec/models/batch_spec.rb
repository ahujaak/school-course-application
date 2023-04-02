# frozen_string_literal: true

require "rails_helper"

RSpec.describe Batch, type: :model do
  let(:batch) { create(:batch) }
  context "Validations" do
    subject { create(:batch) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
  end

  context "Custom validations" do
    it 'should give error when end_time is less than start_time' do
      batch.start_time = Time.now - 2.days
      expect(batch.valid?).to eq(false)
      expect { batch.errors.message.to include("can't be in past") }
    end

    it 'should give error when end_time is less than start_time' do
      batch.end_time = batch.start_time - 1.day
      expect(batch.valid?).to eq(false)
      expect { batch.errors.message.to include('should be greater than start time') }
    end
  end
end
