class Product < ActiveRecord::Base
	belongs_to :category
	has_many :photos
	
	# 商品圖片
	has_attached_file :image, :style => {:medium => "300x300>", :thumb => "100x100>"}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	# 外部鍵索引
	# add_index :products, :category_id

	# 價錢須為整數
	validates_numericality_of :price, :only_integer => true
end
