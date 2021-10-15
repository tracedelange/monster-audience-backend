class SubjectsController < ApplicationController

    before_action :set_current_user

    def index #This should return all subjects registered as public
        render json: Subject.where(public: true)
    end
    
    def show
        subject = Subject.find_by(subject_params)
        if subject
            if subject.public == false && subject.user_id != @user.id #Subject exists, but it is not public and the user trying to access is not the author. 
                render json: {error: 'You do not have permission to view this Subject.'}, status: :unauthorized
            else
                render json: subject, status: :ok
            end
        else
            render json: {error: "Subject not found."}, status: 404
        end
    end

    def mine #Returns all subjects that the user has created
        render json: Subject.where(user_id: @user.id)
    end

    def create
        newSubject = @user.subjects.create(subject_params)
        if newSubject.valid?
            render json: newSubject, status: :created
        else
            render json: {errors: newSubject.errors}, status: :unprocessable_entity
        end
    end

    def update

        subject = @user.subjects.find_by(id: params[:id])

        if subject
            subject.update(subject_params)
            if subject.valid?
                render json: subject, status: :ok
            else
                render json: {errors: subject.errors }, status: :unprocessable_entity
            end
        else
            render json: {error: "Either you don't have permission to update the Subject or it does not exist."}, status: 404
        end
    end

    def destroy
        subject = @user.subjects.find_by(id: params[:id])
        if subject
            subject.delete
            if subject.destroyed?
                head :no_content
            else
                render json: {error: 'Subject could not be deleted.'}
            end
        else
            render json: {error: "Subject not found."}, status: 404
        end
    end 

    def search
        if params[:query] == nil
            render json: {error: "Blank search queries will not be accepted."}, status: :unprocessable_entity
        else
            search_results = Subject.where("name LIKE ? OR description LIKE ? OR city LIKE ?", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%")
            render json: search_results, status: :ok
        end
    end


    private

    def subject_params
        params.permit(:name, :description, :city, :state, :id, :public)
    end

end

# subjects_mine GET    /subjects/mine(.:format)                                                            subjects#mine
# subjects GET    /subjects(.:format)                                                                      subjects#index
# POST   /subjects(.:format)                                                                               subjects#create
# subject GET    /subjects/:id(.:format)                                                                   subjects#show
# PATCH  /subjects/:id(.:format)                                                                           subjects#update
# PUT    /subjects/:id(.:format)                                                                           subjects#update
# DELETE /subjects/:id(.:format)                                                                           subjects#destroy
