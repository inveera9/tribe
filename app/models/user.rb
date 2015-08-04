class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :pins
  has_many :tribes
  validates :fname, presence: true
  has_attachment  :avatar, accept: [:jpg, :png, :gif]
  acts_as_commontator
	after_create :create_tribe
  private
    def create_tribe
      @tribe=Tribe.new(tribe_name:self.lname,user_id:self.id)
      @tribe.save
    end
end
