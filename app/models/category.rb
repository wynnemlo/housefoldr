class Category < ActiveRecord::Base
  has_many :items, -> { order("purchase_date DESC") }
  validates_presence_of :name
end
