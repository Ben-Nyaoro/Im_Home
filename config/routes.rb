Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'landing', to: "pages#landing"
  get 'welcome', to: "pages#welcome"
  get 'safe_places_intro', to: "pages#safe_places_intro"
  get 'buddy_intro', to: "pages#buddy_intro"
  get 'add_buddy_intro', to: "pages#add_buddy_intro"
  get 'add_safe_place_intro', to: "pages#add_safe_place_intro"
	get 'profile', to: "pages#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :journeys
  resources :safe_places
  resources :buddies
  resources :addresses
	#Ex:- :default =>''
end
