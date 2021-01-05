class ItinerariesController < ApplicationController
    before_action :not_logged_in

    def index
        @itineraries = Itinerary.all
    end
    
    def show
        @itinerary = Itinerary.find(params[:id])
    end
    def new
        @itinerary = Itinerary.new
    end

    def create 
        @itinerary = Itinerary.new(itinerary_params)
        if @itinerary.save
            redirect_to @itinerary 
        else
            flash[:errors] = @itinerary.errors.full_messages
            redirect_to new_itinerary_path
        end
    end

    private
    def itinerary_params
        params.require(:itinerary).permit(:name, :user_id)
    end
end
