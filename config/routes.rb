Rails.application.routes.draw do
  root 'static_pages#home'
  resources :static_pages
end
