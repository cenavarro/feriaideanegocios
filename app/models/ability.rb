class Ability
  include CanCan::Ability

  def initialize(user)
    send("#{user.class.to_s.underscore}_privileges", user)
  end

  private
  def admin_user_privileges(user)
    can :manage, :all
  end

  def judge_privileges(user)
    can :read, ActiveAdmin::Page, name: "Dashboard"
    can :read, Participant
    can :read, Project
    can :manage, Rating
  end
end

