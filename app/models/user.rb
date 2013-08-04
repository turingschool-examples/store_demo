class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :display_name, :email, :full_name,
                  :admin, :password, :password_confirmation

  validates_confirmation_of :password,
                            message: "passwords did not match", if: :password
  validates_presence_of :password, :on => :create
  validates :full_name, presence: :true
  validates :email, presence: :true, uniqueness: :true,
            format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  validates :display_name, length: { in: 2..32 }, allow_blank: :true

  has_many :orders

  def default_values
    self.admin = false
  end

  def display_name
    read_attribute(:display_name) || "Anonymous"
  end
end
