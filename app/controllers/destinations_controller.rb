class DestinationsController < ApplicationController
    before_action :not_logged_in
    def index
        @destinations = Destination.all
    end
    def show
        @destination = Destination.find(params[:id])
    end
end
