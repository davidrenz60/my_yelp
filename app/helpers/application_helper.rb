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

  def rating_class(rating, size)
    return "" if rating.nil?
    rating = rating.to_s
    class_name = "#{size}-rating-#{rating[0]}"
    class_name += "-half" if rating.end_with?('.5')
    class_name
  end
end
