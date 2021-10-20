Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
   get '/Stars Shop/accueil', to: 'boutiques#accueil'
   resources :posts, :categories, :souscategories
  root to: 'boutiques#accueil'
end
