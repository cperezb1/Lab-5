class Chat < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :messages

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validate :sender_and_receiver_different

  scope :for_user, ->(user) { where("sender_id = ? OR receiver_id = ?", user.id, user.id) }

  def other_participant(current_user)
    current_user == sender ? receiver : sender
  end

  private

  def sender_and_receiver_different
    errors.add(:receiver_id, "can't be the same as sender") if sender_id == receiver_id
  end
end
