Rails.application.routes.draw do

	# Sessions
	get '/login' => 'sessions#new', as: 'login'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy', as: 'logout'

	# Users
	resources :users, only: [:index, :create]
	get '/signup' => 'users#new', as: 'signup'
	get '/:user_name' => 'users#show', as: 'user'

	root 'indexpage#index'
end
