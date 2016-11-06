Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, except: :new do
    resources :albums, only: [:index, :create, :update, :destroy]

    collection do
      post '/login', to: 'users#login'
    end
  end
  resources :albums, only: [:show] do
    resources :photos, only: [:index, :create]
  end
  resources :photos, only: [:show, :destroy] do
    resources :comments, only: [:index, :create, :destroy]
  end

  resources :photos, only: [:create, :destroy]
end


# Prefix Verb   URI Pattern                          Controller#Action
#          root GET    /                                    welcome#index
#   user_albums GET    /users/:user_id/albums(.:format)     albums#index
#               POST   /users/:user_id/albums(.:format)     albums#create
#   login_users POST   /users/login(.:format)               users#login
#         users GET    /users(.:format)                     users#index
#               POST   /users(.:format)                     users#create
#     edit_user GET    /users/:id/edit(.:format)            users#edit
#          user GET    /users/:id(.:format)                 users#show
#               PATCH  /users/:id(.:format)                 users#update
#               PUT    /users/:id(.:format)                 users#update
#               DELETE /users/:id(.:format)                 users#destroy
#  album_photos GET    /albums/:album_id/photos(.:format)   photos#index
#               POST   /albums/:album_id/photos(.:format)   photos#create
#         album GET    /albums/:id(.:format)                albums#show
#               PATCH  /albums/:id(.:format)                albums#update
#               PUT    /albums/:id(.:format)                albums#update
#               DELETE /albums/:id(.:format)                albums#destroy
# photo_comments GET    /photos/:photo_id/comments(.:format) comments#index
#               POST   /photos/:photo_id/comments(.:format) comments#create
#         photo GET    /photos/:id(.:format)                photos#show
#               DELETE /photos/:id(.:format)                photos#destroy
#        photos POST   /photos(.:format)                    photos#create
#               DELETE /photos/:id(.:format)                photos#destroy
#       comment DELETE /comments/:id(.:format)              comments#destroy
