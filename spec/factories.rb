require 'factory_girl'

Factory.sequence :category_name do |n|
  "category #{rand(100000)}" 
end


Factory.define :item do |f|
  f.name 'item'
  f.description 'desc'
  f.price 1.5
end

Factory.define :category do |f|
  f.name {Factory.next(:category_name)}
end

Factory.define :subcategory do |f|
  f.category {|a| a.association(:category) }
  f.name {Factory.next(:category_name)}
end

Factory.define :special_item do |f|
  f.name "special name"
  f.price 2.00
  f.subcategory {|a| a.association(:subcategory) }
  f.category {|a| a.association(:category) }
end
