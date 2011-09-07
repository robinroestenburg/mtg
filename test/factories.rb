Factory.define :card do |c|
  c.name "Foo"
  
  c.sequence(:identifier) { |n| n }  
  
  c.association :color
  c.association :rarity
end

Factory.define :color do |c|
  c.identifier "B"
  c.name "Black"
end

Factory.define :rarity do |r|
  r.identifier "Rare"
  r.name "Rare"
end

Factory.define :card_image do |ci|
  ci.data "check_this_out"
  ci.content_type "image/jpeg"
  ci.size 31668
end

Factory.define :card_mana do |cm|
  cm.sequence(:mana_order) { |n| n } 
  cm.association :mana
end

Factory.define :mana do |m|
   m.code "R"
end
