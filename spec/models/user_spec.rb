# frozen_string_literal: true

require "rails_helper"
require "cancan/matchers"

RSpec.describe User, type: :model do

  let(:user) { create(:user) }
  context "Validations" do
    subject { create(:user) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should_not allow_value('invalid-email').for(:email) }
    it { should define_enum_for(:role).with_values([:admin, :school_admin, :student]) }
  end

  context "methods" do
    it 'verified the user full_name' do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end

  context "devise methods" do
    let(:user) { create(:user, password: 'password123', password_confirmation: 'password123') }
    it 'is database authenticable' do
      expect(user.valid_password?('password123')).to be_truthy
    end
  end

  describe "abilities" do
    context 'admin user' do
      let(:admin_user) { create(:admin_user) }
      subject(:ability) { Ability.new(admin_user) }

      it 'does not have admin role' do
        expect(admin_user.admin?).to eq(true)
      end

      it { is_expected.to be_able_to(:manage, :all) }
    end

    context 'school admin user' do
      let(:school_admin) { create(:school_admin) }
      subject(:ability) { Ability.new(school_admin) }

      it 'does not have admin role' do
        expect(school_admin.school_admin?).to eq(true)
      end

      it { is_expected.to be_able_to(:create, School) }
      it { is_expected.to be_able_to(:manage, Course) }
      it { is_expected.to be_able_to(:manage, Batch) }
      it { is_expected.to be_able_to(:manage, EnrollmentRequest) }
    end

    context 'student' do
      let(:student) { create(:student) }
      subject(:ability) { Ability.new(student) }

      it 'does not have admin role' do
        expect(student.student?).to eq(true)
      end

      it { is_expected.to be_able_to(:read, :all) }
      it { is_expected.to_not be_able_to(:create, School) }
      it { is_expected.to_not be_able_to(:update, School) }
      it { is_expected.to_not be_able_to(:destroy, School) }
      it { is_expected.to_not be_able_to(:create, Batch) }
      it { is_expected.to_not be_able_to(:update, Batch) }
      it { is_expected.to_not be_able_to(:destroy, Batch) }
      it { is_expected.to_not be_able_to(:create, Course) }
      it { is_expected.to_not be_able_to(:update, Course) }
      it { is_expected.to_not be_able_to(:destroy, Course) }
    end
  end
end
