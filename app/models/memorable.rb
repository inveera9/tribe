class Memorable < ActiveRecord::Base
    belongs_to :memory
    has_attachments :images
	acts_as_taggable
end
