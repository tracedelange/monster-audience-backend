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

    # private


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
