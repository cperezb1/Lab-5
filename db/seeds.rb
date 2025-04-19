10.times do |i|
    User.create!(
      email: "user#{i}@example.com",                
      first_name: "Nombre#{i}",                    
      last_name: "Apellido#{i}"                    
    )
  end

  
  10.times do
    sender_id = User.pluck(:id).sample
    receiver_id = User.pluck(:id).sample
  
    while sender_id == receiver_id
      receiver_id = User.pluck(:id).sample
    end
  
    Chat.create!(
      sender_id: sender_id,
      receiver_id: receiver_id
    )
  end
  
  10.times do
    Message.create!(
      chat_id: Chat.pluck(:id).sample,              
      user_id: User.pluck(:id).sample,              
      body: "Mensaje de prueba #{rand(1000)}" 
    )
  end
  