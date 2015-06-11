class CategoriesController < ApplicationController
  before_action :sidebar_categories
  layout "categories"
end
