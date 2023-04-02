# frozen_string_literal: true

require "rails_helper"

RSpec.describe School, type: :model do
  context "Validations" do
    subject { create(:school) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should_not allow_value('invalid-email').for(:email) }
  end

  context "association" do
    it { should belong_to(:admin).class_name('User').with_foreign_key('admin_id') }
    it { should have_many(:courses) }
    it { should have_many(:batches) }
  end
end
