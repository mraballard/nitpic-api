Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:index, :create, :show, :update, :destroy] do
    member do
      get '/albums', to: 'albums#showall'
    end
    resources :albums, only: [:show, :create] do
      resources :photos, only: [:index, :show, :create] do
        resources :comments, only: [:index, :create]
      end
    end

    collection do
      post '/login', to: 'users#login'
    end
  end
  resources :albums, only: [:index, :update, :destroy]
  resources :photos, only: [:create, :destroy]
  resources :comments, only: [:destroy]
end


# Prefix Verb   URI Pattern                                                          Controller#Action
#                     root GET    /                                                                    welcome#index
#              albums_user GET    /users/:id/albums(.:format)                                          albums#showall
# user_album_photo_comments GET    /users/:user_id/albums/:album_id/photos/:photo_id/comments(.:format) comments#index
#                          POST   /users/:user_id/albums/:album_id/photos/:photo_id/comments(.:format) comments#create
#        user_album_photos GET    /users/:user_id/albums/:album_id/photos(.:format)                    photos#index
#                          POST   /users/:user_id/albums/:album_id/photos(.:format)                    photos#create
#         user_album_photo GET    /users/:user_id/albums/:album_id/photos/:id(.:format)                photos#show
#              user_albums POST   /users/:user_id/albums(.:format)                                     albums#create
#               user_album GET    /users/:user_id/albums/:id(.:format)                                 albums#show
#              login_users POST   /users/login(.:format)                                               users#login
#                    users GET    /users(.:format)                                                     users#index
#                          POST   /users(.:format)                                                     users#create
#                     user GET    /users/:id(.:format)                                                 users#show
#                          PATCH  /users/:id(.:format)                                                 users#update
#                          PUT    /users/:id(.:format)                                                 users#update
#                          DELETE /users/:id(.:format)                                                 users#destroy
#                   albums GET    /albums(.:format)                                                    albums#index
#                    album PATCH  /albums/:id(.:format)                                                albums#update
#                          PUT    /albums/:id(.:format)                                                albums#update
#                          DELETE /albums/:id(.:format)                                                albums#destroy
#                new_photo GET    /photos/new(.:format)                                                photos#new
#                    photo DELETE /photos/:id(.:format)                                                photos#destroy
#                  comment DELETE /comments/:id(.:format)                                              comments#destroy
