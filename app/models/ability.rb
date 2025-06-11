class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # usuario invitado (no logueado)

    if user.persisted?
      # Usuarios autenticados pueden:
      can :read, User   # ver usuarios
      can [:edit, :update], User, id: user.id # editar solo su perfil

      can :read, Chat
      can [:create, :update, :destroy], Chat, sender_id: user.id
      can :read, Message
      can [:create, :update, :destroy], Message, user_id: user.id

      # Aquí puedes agregar otras reglas si agregas más modelos
    else
      # Invitados (no autenticados) solo pueden registrarse
      can :new, User
      can :create, User
    end
  end
end
