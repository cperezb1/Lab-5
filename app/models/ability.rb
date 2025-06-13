class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest

    if user.persisted?
      can :read, User, id: user.id # solo puede ver su propio perfil
      can [:edit, :update], User, id: user.id

      can :read, Chat, sender_id: user.id
      can :read, Chat, receiver_id: user.id
      can [:create, :update, :destroy], Chat, sender_id: user.id

      can :read, Message
      can [:create, :update, :destroy], Message, user_id: user.id
    else
      can :new, User
      can :create, User
    end
  end
end
