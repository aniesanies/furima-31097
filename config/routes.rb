Rails.application.routes.draw do
  get 'furima/index'
  root to: "furima#index"
end
