class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_staff
  
    def index
      @orders = Order.by_status(params[:status]).includes(:user)
    end
  
    private
  
    def check_staff
      redirect_to root_path, alert: "Access Denied" unless current_user.staff?
    end
  end
  