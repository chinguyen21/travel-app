class ReviewsController < ApplicationController
    before_action :not_logged_in

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to destination_path(@review.destination)
        else
            flash[:errors] = @review.errors.full_messages
            redirect_to destination_path(@review.destination)
        end
    end

    private
    def review_params
        params.require(:review).permit(:rating, :content, :user_id, :destination_id)
    end
end
