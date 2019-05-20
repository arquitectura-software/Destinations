class DestinationsController < ApplicationController
    before_action :set_destination, only: [:show, :update, :destroy]
    
    # GET /destinations
    def index
      @destinations = Destination.all
  
      render json: @destinations.as_json(only: [:id_destination, :name, :weather, :description, :time_zone, :landing_time, :boarding_time])
    end
  
    # GET /destinations/1
    def show
      render json: @destination.as_json(only: [:id_destination, :name, :weather, :description, :time_zone, :landing_time, :boarding_time])
    end
  
    # POST /destinations
    def create
      @destination = Destination.new(destination_params)
      # @date1 = JSON.parse(request.body.read)['landing_time']
      # @date2 = JSON.parse(request.body.read)['boarding_time']
      # DateTime.parse(@date1)
      # DateTime.parse(@date2)
      if @destination.save
        render json: @destination, status: :created, location: @destination
      else
        render json: @destination.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /destinations/1
    def update
      if @destination.update(destination_params)
        render json: @destination
      else
        render json: @destination.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /destinations/1
    def destroy
      if @destination.destroy
        render json: {"Message":"Destination deleted successfully"}
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_destination
        @destination = Destination.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def destination_params
        params.require(:destination).permit(:id_destination, :name, :weather, :description, :time_zone, :landing_time, :boarding_time)
      end
  end