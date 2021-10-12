class FeedsController < ApplicationController

    before_action :set_current_user

    def index

        reviews = []
        following = @user.friends
        following.each do |user|
            user.reviews.each do |review|
                reviews.append(review)
            end
        end
        
        reviews = sorted(reviews)
        
        

        render json: reviews



    end

    private

    def sorted(reviews)


        reviews.sort_by {|review| review['updated_at'] }.reverse


    end


    # def sort_subjects(subjects)
    #     subjects.sort_by do |subject|
           
    #         if subject["reviews"]
    #             subject['reviews'][0]['created_at']

    #         else
    #             subject['created_at']
    #         end
    #     end
    # end


end
