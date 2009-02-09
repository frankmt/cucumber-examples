require 'factory_girl'

Factory.define :item do |f|
  f.name "name"
  f.description "desc"
  f.price 1.54
end

Factory.define :category do |f|
  f.name "category 1"
end

Factory.define :subcategory do |f|
  f.category {|a| a.association(:category) }
  f.name "category 1"
end

Factory.define :special_item do |f|
  f.name "special name"
  f.price 2.00
  f.subcategory {|a| a.association(:subcategory) }
  f.category {|a| a.association(:category) }
end
