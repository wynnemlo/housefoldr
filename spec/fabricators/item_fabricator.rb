Fabricator(:item) do
  name { Faker::Commerce.product_name }
  model { Faker::Code.isbn }
  price { Faker::Commerce.price }
  serial { Faker::Code.ean }
  end_of_warranty { Faker::Date.forward(30) }
  purchase_date { Faker::Date.backward(365) }
  purchase_location { Faker::Address.street_name }
  method_of_payment { ["Credit Card", "Cash"].sample }
  notes { Faker::Lorem.sentence }
end