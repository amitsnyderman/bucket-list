class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :items, :dependent => :destroy, :after_add => :execute_actions
  has_many :buckets, :through => :items
  has_many :actions, :dependent => :destroy
  
  validates_presence_of :phone_number
  validates_uniqueness_of :phone_number
  
  def execute_actions(item)
    self.actions.where(:bucket_id => item.bucket.id).each do |action|
      action.execute(item)
    end
  end
end
