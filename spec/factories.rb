require 'factory_girl'

Factory.define :item do |f|
  f.name "name"
  f.description "desc"
  f.price 1.54
end
