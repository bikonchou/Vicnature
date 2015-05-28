class Photo < ActiveRecord::Base
	belongs_to :product
	has_attached_file :file, :style => {:medium => "300x300#", :thumb => "100x100#"}
	validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
end
