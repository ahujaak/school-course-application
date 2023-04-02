# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
    when 'admin'
      can :manage, :all
    when 'school_admin'
      can :manage, School, admin: user
      can :manage, Course
      can :manage, Batch
      can :manage, EnrollmentRequest
    when 'student'
      can [:read, :approved_students], :all
      can [:read, :new, :create], EnrollmentRequest, student: user
    end
  end
end
