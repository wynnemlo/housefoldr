module ApplicationHelper
  def pretty_price(price)
    "$ #{price}"
  end

  def pretty_date(datetime)
    datetime.strftime("%m/%d/%Y")
  end
end
