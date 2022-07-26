class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :authenticate_user!
  
    def index
      @users = User.all
    end
  
    def show
    end
  
    def new
      @user = User.new
    end
  
    def edit
      authorize! :edit, @user
  
    end
  
    def create
      @user = User.new(user_params)
  
      respond_to do |format|
  
        if @user.save
          
          format.html { redirect_to user_url(@user), notice: "Successfully created the User." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "Successfully updated the User." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  

    def update 
      if user_params[:password].blank?
        user_params.delete(:password)
        user_params.delete(:password_confirmation)
  
      end
      successfully_updated = if needs_password?(@user, user_params)
                                @user.update(user_params)
                            else
                                @user.update_without_password(user_params)
                            end 
      if successfully_updated
        redirect_to @user, notice: 'Successfully Updated the User'
  
      else 
        render 'edit'
      end 
    end
  
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "Successfully Destroyed the User." }
        format.json { head :no_content }
      end
    end
  
    private
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(
          :email,
          :name,
          :password,
          :password_confirmation,
          :role_id)
      end
  
      def needs_password?(_user, params)
        params[:password].present?
      end
  end