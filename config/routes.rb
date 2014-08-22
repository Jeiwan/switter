Rails.application.routes.draw do

	# Sessions
	get '/login' => 'sessions#new', as: 'login'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy', as: 'logout'

	# Users
	resources :users, only: [:index, :create]
	get '/signup' => 'users#new', as: 'signup'
	get '/settings' => 'users#edit', as: 'settings'
	put '/settings' => 'users#update'
	get '/:user_name' => 'users#show', as: 'user'

	# Microposts
	post '/newmicropost' => 'microposts#create', as: 'new_micropost'
	delete '/delmicropost/:id' => 'microposts#destroy', as: 'del_micropost'

	root 'indexpage#index'
end
