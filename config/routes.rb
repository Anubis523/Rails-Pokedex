Rails.application.routes.draw do
  resources :pokemons, only: [:index, :show, :new, :create, :edit, :update]
  # get '/eric', to: 'pokemons#eric', as: 'eric'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
