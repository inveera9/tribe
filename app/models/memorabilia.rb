class Memorabilia < ActiveRecord::Base
    belongs_to :memory
    has_attachment :image
    
	acts_as_taggable
end
