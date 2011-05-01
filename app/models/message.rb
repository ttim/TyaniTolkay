class Message < ActiveRecord::Base
  belongs_to :ad
  belongs_to :user

  belongs_to :message
#  has_one :message

  before_save :before_save_method

  def before_save_method
    return if self.reply_user_id != nil
    parent_message = self.parent_message
    return if parent_message == nil

    if self.user_id == parent_message.user_id
      self.reply_user_id = parent_message.reply_user_id
    else
      self.reply_user_id = parent_message.user_id
    end
  end

  def parent_message
    Message.find_by_id(self.message_id)
  end

  def children_messages
    Message.find_all_by_message_id(self.id)
  end

  def visisble_for_user?(user)
    return true if self.reply_user_id == nil
    return true if self.user_id == user.id
    return true if self.reply_user_id = user.id

    false
  end
end
