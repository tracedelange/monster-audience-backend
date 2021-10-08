class FeedsController < ApplicationController

    before_action :set_current_user

    def index

        # render json: @user.friends

        subjects = []
        following = @user.friends
        following.each do |user|
            user.subjects.each do |subject|
                subjects.append(subject)
            end
        end

        render json: subjects

    end

        # render json: {feed: FeedSerializer.new(current_user)}
    
        # follwing = @user.friends
        # posts = []
        # follwing.each do |user|
        #     reviews = user.reviews
        #     posts.append(reviews)
        # end

        # render json: posts


end
