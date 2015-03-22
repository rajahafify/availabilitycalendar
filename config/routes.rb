Rails.application.routes.draw do
  root to: 'booking_calendars#index'
  resources :bookings
end
