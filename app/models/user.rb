class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessible :name, :role

  validates_presence_of :name
  validates_uniqueness_of :email
  validates_inclusion_of :role, :in => %w(user admin)

  before_create :default_role

  def default_role
    self.role = "user"
  end

  def simple_user?
    self.role == "user"
  end

  def admin?
    self.role == "admin"
  end
end
