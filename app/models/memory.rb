class Memory < ActiveRecord::Base
    belongs_to :user
	has_attachment :image
	

	validates :title, presence: true
	validates :description, presence: true
	acts_as_taggable
end
