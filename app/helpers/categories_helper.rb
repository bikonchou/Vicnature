module CategoriesHelper
	def sidebar_categories
		@categories = Category.all
	end
end
