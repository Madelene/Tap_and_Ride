class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all

    render json: @trips
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    render json: @trip
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(user_id: current_user.id)
    @trip.start_point = Station.find_by(uid: params[:station_id])
    #Defined current user and updated credits. This change may cause issues.
    @current_user = current_user
    @current_user.credits = (@current_user.credits - 1)

    if @trip.save
      @current_user.save
      #This is where the change ends
      render json: @trip.attributes.merge(station: @trip.start_point.attributes), status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    if @trip.end_point = Station.find_by(uid: params[:station_id])
      render json: @trip.attributes.merge(station: @trip.end_point.attributes), location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy

    head :no_content
  end

  private

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:user_id, :start_point_id, :end_point_id)
    end
end
