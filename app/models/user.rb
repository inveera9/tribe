class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :pins
  validates :name, presence: true
  
  acts_as_commontator

has_attachment  :avatar, accept: [:jpg, :png, :gif]
has_attachments :photos, maximum: 100
validates :avatar, presence: true
validates :name, presence: true

end
