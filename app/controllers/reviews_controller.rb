class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

# Issues with create method
# 1. The below code doesn't work
# if @review.save
# redirect_to restaurant_path(@restaurant)
# else
# render :new, status: :unprocessable_entity
# 2. Submitting a review doesn't create an instance of the review that shows on the page
