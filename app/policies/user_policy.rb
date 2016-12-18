class UserPolicy < ApplicationPolicy
  def destroy?
    user == @record
  end

  def edit?
    user == @record
  end

  def update?
    user == @record
  end
end