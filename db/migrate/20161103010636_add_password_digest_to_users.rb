class AddPasswordDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    resources :users, only: [:create, :show, :destroy] do
      collection do
     post '/login', to: 'users#login'
   end
  end
end
