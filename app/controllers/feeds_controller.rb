class FeedsController < ApplicationController

    before_action :set_current_user

    def index
        
        #Updated method:
        start = 0
        page_size = 10
        if params[:page]
            start = 10 * params[:page].to_i
        end
        render json: Subject.where(user_id: @user.friends.ids).order('updated_at').reverse()[start, 10]
    end

    def show
        start = 0
        page_size = 10
        if params[:page]
            start = 10 * params[:page].to_i
        end
        owned_subjects = Subject.where(user_id: params[:id]).order('updated_at').reverse()[start, 10]
        reviewed_subjects = Review.where(user_id: params[:id]).order('updated_at').reverse()[start, 10]
        user = User.find(params[:id])

        if reviewed_subjects && owned_subjects
            render json: {
                reviews: ActiveModel::Serializer::CollectionSerializer.new(reviewed_subjects, each_serializer: ReviewSerializer),
                subjects: ActiveModel::Serializer::CollectionSerializer.new(owned_subjects, each_serializer: SubjectSerializer),
                userDetails: UserSerializer.new(user, current_user: @user)
                }, status: :ok
        elsif reviewed_subjects
            render json: {
                reviews: ActiveModel::Serializer::CollectionSerializer.new(reviewed_subjects, each_serializer: ReviewSerializer),
                subjects: [],
                userDetails: UserSerializer.new(user, current_user: @user)
                }, status: :ok
        elsif owned_subjects
            render json: {
                reviews: [],
                subjects: ActiveModel::Serializer::CollectionSerializer.new(owned_subjects, each_serializer: SubjectSerializer),
                userDetails: UserSerializer.new(user, current_user: @user)
                }, status: :ok
        else
            render json: {
                reviews: [],
                subjects: [],
                userDetails: UserSerializer.new(user, current_user: @user)
                }, status: :ok
        end



    end

        #Working but inefficient:

        # subjects = []
        # following = @user.friends
        # following.each do |user|
        #     user.subjects.each do |subject|
        #         subjects.append(subject)
        #     end
        # end


        # render json: sorted(subjects)

        #Current Route:
        #Create an empty array
        #Create an array of users logged in user is following
        #Iterate over following array
        #iterate over each subject array for each user o(n^2)!!!!
        #append each subject to empty array
        #return empty array sorted by date-created-at.

        #Alternate route:
        #Access all subjects via Subjects.all
        #Somehow filter Subjects to only those where id = an id contained in following list.
        #Order by 'updated_at'
        #Incorporate pagination how Enoch suggested.
        #Let's Try!


        #Timings:
        #Original method calling and returning entire feed:
        #Completed 200 OK in 737ms (Views: 532.2ms | ActiveRecord: 129.4ms | Allocations: 247746)

        #Updated method calling and returning entire feed:
        #Completed 200 OK in 655ms (Views: 528.7ms | ActiveRecord: 98.4ms | Allocations: 213566)

        #Updated method calling and returning a page of 10
        #Completed 200 OK in 208ms (Views: 124.0ms | ActiveRecord: 47.9ms | Allocations: 59958)
        #Looks like this is clearly the most effecient method. Whoohoo!

    

    # private


    def sorted(subjects)
        subjects.sort_by {|subject| subject['updated_at'] }.reverse
    end


end
