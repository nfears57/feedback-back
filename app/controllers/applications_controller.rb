class ApplicationsController < ApplicationController

    def show
        application = Application.find_by(id: params[:id])
        if application
        render json: application
        else
            render json {'Application not found'}, status: :not_found
        end
    end
end
