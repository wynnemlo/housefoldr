require 'spec_helper'
require 'rails_helper'

describe Item do
  it { should validate_presence_of(:name) }
  it { should belong_to(:user) }
  it { should belong_to(:category) }
  
  describe 'search_by_name' do
    it "returns an empty array if the search term is an empty string" do
      item = Fabricate(:item, name: "TV")
      expect(Item.search_by_name("")).to eq([])
    end
    it "returns an empty array if there are no matches" do
      item = Fabricate(:item, name: "TV")
      expect(Item.search_by_name("Something")).to eq([])
    end
    it "returns an array of one item when there is an exact match" do
      item = Fabricate(:item, name: "TV")
      expect(Item.search_by_name("TV")).to eq([item])
    end
    it "returns n array of one item when there is an exact match with different case" do
      item = Fabricate(:item, name: "TV")
      expect(Item.search_by_name("tv")).to eq([item])
    end
    it "returns an array of one item when there is a partial match" do
      item = Fabricate(:item, name: "TV")
      expect(Item.search_by_name("T")).to eq([item])
    end
    it "returns an array of all matches ordered by purchase date in descending order" do
      item = Fabricate(:item, name: "TV", purchase_date: 1.day.ago)
      item2 = Fabricate(:item, name: "Tivo", purchase_date: 2.days.ago)
      expect(Item.search_by_name("T")).to eq([item, item2])
    end
  end

end