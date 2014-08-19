Rails.application.routes.draw do

	# Sessions
	get '/login' => 'sessions#new', as: 'login'

	# Users
	resources :users, only: [:index, :create]
	get '/signup' => 'users#new', as: 'signup'

	root 'indexpage#index'
end
