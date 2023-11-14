class ReviewsController < ApplicationController
    before_action :find_restaurant, :set_restaurant, only: %i[new create]
  
    def new
      @restaurant = Restaurant.find(params[:restaurant_id])
      @review = @restaurant.reviews.new
    end
  
    def create
      @review = Review.new(review_params)
      @review.restaurant = @restaurant
      if @review.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
  
    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to restaurant_path(@review.restaurant), status: :see_other
    end
  
    def review_params
      params.require(:review).permit(:rating, :content)
    end
    
  end