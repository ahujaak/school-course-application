class School < ApplicationRecord
  belongs_to :admin, -> { where "users.role = 1" }, class_name: "User", foreign_key: "admin_id"
                        # role 1 here is the school admin

  has_many :courses, dependent: :destroy
  has_many :batches, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP
  
end
