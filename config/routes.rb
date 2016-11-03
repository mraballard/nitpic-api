Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :albums, only: [:show, :create] do
      resources :photos, only: [:index, :show, :create] do
        resources :comments, only: [:index, :create, :destroy]
      end
    end

    collection do
      post '/login', to: 'users#login'
    end
  end
  resources :albums, only: [:index, :update, :destroy]
  resources :photos, only: [:destroy]
end


# Prefix Verb   URI Pattern                                                              Controller#Action
# user_album_photo_comments GET    /users/:user_id/albums/:album_id/photos/:photo_id/comments(.:format)     comments#index
#        POST   /users/:user_id/albums/:album_id/photos/:photo_id/comments(.:format)     comments#create
# user_album_photo_comment DELETE /users/:user_id/albums/:album_id/photos/:photo_id/comments/:id(.:format) comments#destroy
# user_album_photos GET    /users/:user_id/albums/:album_id/photos(.:format)                        photos#index
#        POST   /users/:user_id/albums/:album_id/photos(.:format)                        photos#create
# user_album_photo GET    /users/:user_id/albums/:album_id/photos/:id(.:format)                    photos#show
#        DELETE /users/:user_id/albums/:album_id/photos/:id(.:format)                    photos#destroy
# user_albums GET    /users/:user_id/albums(.:format)                                         albums#index
#        POST   /users/:user_id/albums(.:format)                                         albums#create
# user_album GET    /users/:user_id/albums/:id(.:format)                                     albums#show
#        PATCH  /users/:user_id/albums/:id(.:format)                                     albums#update
#        PUT    /users/:user_id/albums/:id(.:format)                                     albums#update
#        DELETE /users/:user_id/albums/:id(.:format)                                     albums#destroy
# login_users POST   /users/login(.:format)                                                   users#login
#  users POST   /users(.:format)                                                         users#create
#   user GET    /users/:id(.:format)                                                     users#show
#        PATCH  /users/:id(.:format)                                                     users#update
#        PUT    /users/:id(.:format)                                                     users#update
#        DELETE /users/:id(.:format)                                                     users#destroy
