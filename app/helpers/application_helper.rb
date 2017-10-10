module ApplicationHelper
  def display_month_year(date)
    date.strftime("%B %Y")
  end

  def display_date(date)
    date.strftime("%m/%d/%Y")
  end

  def options_for_rating
    ["Choose Rating"] + (1..5).map { |n| [pluralize(n, "Star"), n] }
  end
end
