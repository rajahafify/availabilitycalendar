module BookingCalendarsHelper
  def previous_link
    ->(param, date_range) { link_to raw("&laquo; Prev"), {param => date_range.first - 1.day}, class: 'btn btn-default col-xs-3' }
  end

  def next_link
    ->(param, date_range) { link_to raw("Next &raquo;"), {param => date_range.last + 1.day}, class: 'btn btn-default col-xs-3' }
  end

  def title
    ->(start_date) { content_tag :h2, "#{I18n.t("date.month_names")[start_date.month]} #{start_date.year}", class: "calendar-title col-xs-6" }
  end
end
