class ItemsController < ResourceController::Base
  
  actions :index, :new, :create
  
  create.flash "Item successfully created"
  create.wants.html { redirect_to items_url }
  
end