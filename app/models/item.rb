class Item < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :user
  belongs_to :category

  def self.search_by_name(search_term)
    return [] if search_term.blank?
    where("name ILIKE ?", "%#{search_term}%").order("purchase_date DESC")
  end
end