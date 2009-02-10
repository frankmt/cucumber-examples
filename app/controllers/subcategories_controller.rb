class SubcategoriesController < ApplicationController
  
  def index
    @subcategories = Subcategory.find_all_by_category_id(params[:category_id])
    render :partial => "by_category"
  end
  
end