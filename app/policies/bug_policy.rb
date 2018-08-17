class BugPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.manager?
        scope.all
      end
    end

  end

  def update?
    user.user_type=='qa'
  end

  def create?
    user.user_type=='qa'
  end

  def assign_bug?
     user.user_type=='developer'
  end

end
