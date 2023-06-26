class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
    
        if @user.save
          log_in(@user)
          redirect_to root_url, notice: 'Account created successfully.'
        else
          render :new
        end
      end
    
      def index
        @users = User.all
      end
    
      def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to users_url, notice: 'User account deleted successfully.'
      end

    private

    def render_not_found_response
        render json: { error: "User not found" }, status: :not_found
      end

      def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
      end

      def log_in(user)
        session[:user_id] = user.id
      end

end
