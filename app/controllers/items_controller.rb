class ItemsController < ResourceController::Base
  
  actions :index, :new, :create, :destroy
  
  create.flash "Item successfully created"
  destroy.flash "Item successfully destroyed"
  create.wants.html { redirect_to items_url }
  
end