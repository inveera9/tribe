class Memory < ActiveRecord::Base
    belongs_to :user
    has_many :memorables, dependent: :destroy
	validates :title, presence: true

end
