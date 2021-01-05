class EntriesController < ApplicationController
    before_action :not_logged_in
    def new
        @entry = Entry.new
    end

    def create 
        @entry = Entry.new(entry_params)
        if @entry.save
            redirect_to itinerary_path(@entry.itinerary)
        else
            flash[:errors] = @entry.errors.full_messages
            redirect_to new_entry_path
        end
    end

    private
    def entry_params
        params.require(:entry).permit(:destination_id, :date, :itinerary_id)
    end
end
