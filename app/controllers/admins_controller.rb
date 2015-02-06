class AdminsController < ApplicationController
  def index
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.save
      session[:admin_id] = @admin.id
      redirect_to @admin
    else
      # set errors
      redirect_to '/'
    end
  end

  def show
    if session[:admin_id]
      @admin = Admin.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :pass, :pass_confirmation)
  end
end
