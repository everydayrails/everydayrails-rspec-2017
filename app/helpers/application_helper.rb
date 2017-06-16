module ApplicationHelper
  def full_date(date)
    date_string = date.strftime("%B %d, %Y")
    date_human = time_ago_in_words(date)
    past_or_future = Time.now > date ? "ago" : "from now"
    "#{date_string} (#{date_human} #{past_or_future})"
  end
end
