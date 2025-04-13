#  10 usuarios con nombre y correo
10.times do |i|
    User.create!(
      email: "user#{i}@example.com",                # Puedes cambiar el formato del email
      first_name: "Nombre#{i}",                     # Puedes cambiar el patrón de nombre
      last_name: "Apellido#{i}"                     # Cambia el apellido o hazlo fijo si quieres
    )
  end
  
  # 10 chats entre usuarios aleatorios
  10.times do
    sender_id = User.pluck(:id).sample
    receiver_id = User.pluck(:id).sample
  
    # Asegurarse de que sender y receiver no sean el mismo usuario
    while sender_id == receiver_id
      receiver_id = User.pluck(:id).sample
    end
  
    Chat.create!(
      sender_id: sender_id,
      receiver_id: receiver_id
    )
  end
  
  # Crear 10 mensajes con texto genérico
  10.times do
    Message.create!(
      chat_id: Chat.pluck(:id).sample,              # Puedes hacer que todos los mensajes vayan a un solo chat si quieres
      user_id: User.pluck(:id).sample,              # Cambia esto si quieres que siempre escriba el mismo usuario
      body: "Mensaje de prueba #{rand(1000)}" # Puedes variar el texto o usar lorem ipsum
    )
  end
  