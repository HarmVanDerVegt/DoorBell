Rails.application.routes.draw do
  post 'ajax_check/check'
  resources :images
  get "accept/:id" => "images#accept", as: "accept"
  get "reject/:id" => "images#reject", as: "reject"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
