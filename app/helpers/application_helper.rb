module ApplicationHelper
  def display_month_year(date)
    date.strftime("%B %Y")
  end

  def display_date(date)
    date.strftime("%m/%d/%Y")
  end
end
