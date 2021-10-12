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


        render json: sorted(subjects)

    end

    # private


    def sorted(subjects)
        subjects.sort_by {|subject| subject['updated_at'] }.reverse
    end


end
