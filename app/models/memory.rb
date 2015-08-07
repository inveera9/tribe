class Memory < ActiveRecord::Base
    belongs_to :user
    has_many :memorables, dependent: :destroy
	validates :title, presence: true
	validates :description, presence: true

	acts_as_taggable
end
