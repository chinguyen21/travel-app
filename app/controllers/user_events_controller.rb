class UserEventsController < ApplicationController
    before_action :not_logged_in
end
