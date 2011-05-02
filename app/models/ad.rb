class Ad < ActiveRecord::Base
  belongs_to :user
  has_many :messages

  before_save :before_save_method

  def before_save_method
    return if tags == nil
    self.tags_for_search = tags.split(",").map { |x| x.strip }.sort.join(",")
  end

  def root_messages
    Message.find_all_by_ad_id_and_message_id(self, nil)
  end
end
