require 'factory_girl'

Factory.define :item do |f|
  f.name 'item'
  f.description 'desc'
  f.price 1.5
end
