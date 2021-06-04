class BookingPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.joins(:bike).where(bikes: {user: user} )
    end
  end

  def create?
    true
  end

end
