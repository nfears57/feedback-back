class AdminController < ApplicationController
    def new
      @admin = Admin.new
    end
  
    def create
      @admin = Admin.new(admin_params)
  
      if @admin.save
        log_in(@admin)
        redirect_to root_url, notice: 'Admin account created successfully.'
      else
        render :new
      end
    end
  
    def index
      @admins = Admin.all
    end
  
    def destroy
      admin = Admin.find(params[:id])
      admin.destroy
      redirect_to admins_url, notice: 'Admin account deleted successfully.'
    end
  
    private
  
    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end
  
    def log_in(admin)
      session[:admin_id] = admin.id
    end
  end
  