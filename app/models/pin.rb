class Pin < ActiveRecord::Base
    belongs_to :user
	has_attachment :image
	

	validates :description, presence: true
	acts_as_taggable
	acts_as_commontable

end
