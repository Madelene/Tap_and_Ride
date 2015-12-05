class UsersController < ApplicationController


  def index
   users = user.all

   if start_time = params[:start_time]
     users = users.where(start_time: start_time)
   end

   if end_time = params[:end_time]
     users = users.where(end_time: end_time)
   end

   render json: users, status: 200
  end

  def create
    user = user.new(user_params)
    if user.check
      if user.save
        render json: user, status: :created, location: user
      else
        ￼render json: user.errors, status: 422
      end
    else
      render json: user.errors, status: 422
    end
  end

  def update
     user = user.find(params[:id])
     if user.update(user_params)
       render json: user, status: 200
     else
       render json: user, status: 422
     end
  end

  def destroy
    user = user.find(params[:id])
    user.destroy
    head 204
  end

  private
  def user_params
    params.require(:user).permit(:start_time, :end_time, :first_name, :last_name, :comments)
  end

end
