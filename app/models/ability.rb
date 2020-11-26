# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.role.name == 'admin'
      can :manage, :all
      can :assign_roles, User
    end

    if user.role.name == 'moderator'
      can :read, :all
      can [:create, :edit], User
      can :manage, [Company, Note, ContactPerson]
    end

    if user.role.name == 'regular'
      can :read, [Company, Note, ContactPerson]
      can :create, Company
      can :manage, Company, user_id: user.id
    end
  end
end
