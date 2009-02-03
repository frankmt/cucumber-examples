class Item < ActiveRecord::Base
  validates_presence_of :name, :message => "Name can't be blank"
  validates_presence_of :description, :message => "Description can't be blank"
end