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
	get '/follow/:user_name' => 'users#follow', as: 'follow'
	get '/unfollow/:user_name' => 'users#unfollow', as: 'unfollow'

	# Microposts
	post '/newmicropost' => 'microposts#create', as: 'new_micropost'
	delete '/delmicropost/:id' => 'microposts#destroy', as: 'del_micropost'
	get '/api/microposts.json/:user_nickname/:cursor' => 'microposts#show_json', as: 'api_show'

	root 'indexpage#index'
end
