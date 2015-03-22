module BookingCalendarsHelper
  def previous_link
    ->(param, date_range) { link_to raw("&laquo;"), {param => date_range.first - 1.day}, class: 'btn btn-success' }
  end

  def next_link
    ->(param, date_range) { link_to raw("&raquo;"), {param => date_range.last + 1.day}, class: 'btn btn-success' }
  end
end
