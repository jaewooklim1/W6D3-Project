# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#             user_artworks GET    /users/:user_id/artworks(.:format)                                                       artworks#index
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                  artworks POST   /artworks(.:format)                                                                      artworks#create
#                   artwork GET    /artworks/:id(.:format)                                                                  artworks#show
#                           PATCH  /artworks/:id(.:format)                                                                  artworks#update
#                           PUT    /artworks/:id(.:format)                                                                  artworks#update
#                           DELETE /artworks/:id(.:format)                                                                  artworks#destroy
#            artwork_shares POST   /artwork_shares(.:format)                                                                artwork_shares#create
#             artwork_share DELETE /artwork_shares/:id(.:format)                                                            artwork_shares#destroy
#                  comments GET    /comments(.:format)                                                                      comments#index
#                           POST   /comments(.:format)                                                                      comments#create
#                   comment DELETE /comments/:id(.:format)                                                                  comments#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :destroy, :index, :show, :update] do 
    resources :artworks, only: [:index]
  end

  resources :artworks, only: [:create, :destroy, :show, :update] do 
    resources :likes, only: [:index]
  end

  resources :artwork_shares, only: [:destroy, :create]

  resources :comments, only: [:index, :create, :destroy] do 
    resources :likes, only: [:index]
  end

  resources :likes, only: [:create, :destroy]
  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'#, as: 'users'
  
  # get '/users/new', to: 'users#new', as: 'new_user'

  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  # get '/users/:id', to: 'users#show', as: 'user'
  # patch '/users/:id', to: 'users#update'#, as: 'user'
  # put '/users/:id', to: 'users#update'#, as: 'user'
  # delete '/users/:id', to: 'users#destroy'#, as: 'user'
  
end
