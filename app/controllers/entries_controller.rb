class EntriesController < ApplicationController
    before_action :not_logged_in
    skip_before_action :verify_authenticity_token
    def new
        @entry = Entry.new
        @itineraries = User.find(session[:id]).itineraries
    end

    def create 
        @entry = Entry.new(entry_params)
        if @entry.save
            redirect_to user_itinerary_path( @entry.itinerary.user, @entry.itinerary)
        else
            flash[:errors] = @entry.errors.full_messages
            redirect_to new_entry_path
        end
    end

    def edit 
        @entry = Entry.find(params[:id])
    end

    def update 
        # byebug
        @entry = Entry.find(params[:id])
        @entry.update(visited: true)
        redirect_to user_itinerary_path(@entry.itinerary.user, @entry.itinerary)
    end

    private
    def entry_params
        params.require(:entry).permit(:event_id, :date, :itinerary_id, :visited)
    end
end
