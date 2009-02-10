class SpecialItemsController < ResourceController::Base
  
  actions :index, :new, :create, :destroy
  
  create.flash "Special Item successfully created"
  destroy.flash "Special Item successfully destroyed"
  create.wants.html { redirect_to special_items_url }
  
end