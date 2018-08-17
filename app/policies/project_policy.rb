class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.user_type!='developer'
        scope.all
      else
        user.projects
      end
    end
  end

  def update?
    user.user_type=='manager'&& user_is_owner_of_record
  end

  def create?
    user.user_type=='manager'
  end

  def destroy?
    user.user_type=='manager' && user_is_owner_of_record
  end

  def user_is_owner_of_record
    owner=@record.users.where(id:user.id)
    !owner.empty?
  end
end
