class ReviewsController < ApplicationController

    before_action :set_current_user

    def index
        render json: Review.all, status: :ok
    end

    def mine #Returns all Reviews that the user has created
        render json: Review.where(user_id: @user.id)
    end


    def create
        newReview = @user.reviews.create(review_params)
        if newReview.valid?
            newReview.subject.update(review_count: (newReview.subject.review_count + 1))
            render json: newReview, status: :created
        else
            render json: {errors: newReview.errors}, status: :unprocessable_entity
        end
    end

    def show
        review = Review.find_by(id: params[:id])
        if review
            render json: review, status: :ok
        else 
            render json: {error: 'Review not found.'}, status: 404
        end
    end

    def update
        review = Review.find_by(id: params[:id])
        if review && review.user_id == @user.id
            review.update(review_params)
            if review.valid?
                render json: review, status: :ok
            else
                render json: {errors: review.errors}, status: :unprocessable_entity
            end
        else
            render json: {error: "Permission denied."}, status: :unauthorized
        end
    end

    def destroy
        review = Review.find_by(id: params[:id])
        if review && review.user_id == @user.id
            review.destroy
            newReview.subject.update(review_count: (newReview.subject.review_count + 1))
            head :no_content
        else
            render json: {error: "Permission denied."}, status: :unauthorized
        end
    end

    private

    def review_params
        params.permit(:user_id, :subject_id, :content, :rating)
    end


end

# reviews GET    /reviews(.:format)                                                                        reviews#index
# POST   /reviews(.:format)                                                                                reviews#create
# review GET    /reviews/:id(.:format)                                                                     reviews#show
# PATCH  /reviews/:id(.:format)                                                                            reviews#update
# PUT    /reviews/:id(.:format)                                                                            reviews#update
# DELETE /reviews/:id(.:format)                                                                            reviews#destroy