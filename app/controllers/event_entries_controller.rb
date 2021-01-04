class EventEntriesController < ApplicationController

    def new
        @event_entry = EventEntry.new
    end

    def create 
        @event_entry = EvenEntry.new(event_entry_params)
        if @event_entry.save
            redirect_to @event_entry 
        else
            flash[:errors] = @event_entry.errors.full_messages
            render "new"
        end
    end

    private
    def event_entry_params
        params.require(:event_entry).permit(:event_id, :entry_id)
    end
end
