# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.patient?
      can :read, Exame
    elsif user.doctor?
      can [:create, :update, :read], Exame
    end
  end
end
