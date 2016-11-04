class UsersController < ApplicationController
  before_action :authenticate, except: [:index, :login, :create]

  def index
    # in the case we want a user or non user search
    # another user to look at there albums and photos
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      token = token(user.id, user.username)
      render json: {status: 200, message: "ok", token: token, user: user}
    else
      render json: {status: 422, user: user, errors: user.errors }
    end
  end

  def show
    # we want only the users information so we will send
    # it to the front end
    # if we want to show all the users albums we can set user.albums
    # when it arrives on the front end
    # or do a promise request to ping the albums#index which will return
    # the albums based on the users id like users.album
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {status: 200, user: user}
    else
      render json: {status: 422, user: user}
    end
  end

  def destroy
    User.destroy(params[:id])

    render json: { status: 204 }
  end

  def login
    user = User.find_by(username: params[:user][:username])

      if user && user.authenticate(params[:user][:password])
        token = token(user.id, user.username)
        render json: {status: 201, user: user, token: token}
      else
        render json: {status: 401, message: "unauthorized"}
      end
  end

  private

    def token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    def payload(id, username)
      {
        exp: (Time.now + 1.day).to_i, # Expiration date 24 hours from now
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
    end

    def user_params
      params.required(:user).permit(:username, :password, :name, :surname, :age, :location)
    end

end
