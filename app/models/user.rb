class User < ActiveRecord::Base
  has_many :messages
  has_many :ads

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessible :name, :role

  validates_presence_of :name
  validates_uniqueness_of :email

  before_create :default_role

  def default_role
    self.role = "user" if self.role == nil
  end

  def simple_user?
    self.role == "user"
  end

  def admin?
    self.role == "admin"
  end

  def moderator?
    self.role == "moderator"
  end

  def can_remove_ad?(ad)
    moderator? or admin? or ad.user.id == self.id
  end

  def can_edit_ad?(ad)
    moderator? or admin? or ad.user.id == self.id
  end

  def can_remove_user?(user)
    moderator? or admin? or user.id == self.id
  end

  def can_promote?(user, new_role)
    return true if admin?
    return true if moderator? && new_role == "moderator" && user.role == "user"

    false
  end
end
