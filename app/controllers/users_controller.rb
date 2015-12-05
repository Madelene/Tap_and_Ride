class UsersController < ApplicationController
  before_action :set_appt, only: [:update, :destroy]

# GET
  def index
      user = User.all #issues query to database

    if start_time = params[:start_time]
      user = user.where(start_time: start_time) #adding filters, dynamically, with "where" method
    end

    if end_time = params[:end_time]
      user = user.where(end_time: end_time)
    end
      render json: user, status: 200 #fetching all of the appointments and returning them as json
  end

# POST
  def create
  user = User.new(user_params)
      if user.save
        render nothing: :true, status: 204, location: user #204 == no content
      else
        render json: user.errors, status: :unprocessable_entity #same as 422
      end
  end

# PUT/PATCH
  def update
    if @appointment.update(appointment_params)
    render json: @appointment, status: 200
    else
    render json: @appointment.errors, status: 422
    end
  end

# DELETE
  def destroy
      @user.destroy #removes the record from the database
      head 204
  end

    private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirm, :email, :phone)
  end

  def set_appt
      @user = User.find(params[:id])
  end
end