Rails.application.routes.draw do
 root 'words#index'
 get 'words/index'

 resources :words 
 resources :games do 
  resources :guesses
 end
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


#   root 'articles#index'
# get '/', to: 'articles#index'

# get 'articles/index'
#   get 'articles/index', to: 'articles#index'

#   resources :articles do 
#     resources :comments, only: [:destroy, :create]
#   end