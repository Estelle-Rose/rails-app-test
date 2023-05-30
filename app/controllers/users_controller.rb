# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    users = User.all
    if users.any?
      render :index, locals: { users: }, status: :ok
    else
      render(json: { message: 'users not found' }, status: :not_found)
    end
  end
  def show
    user = User.find(params[:id])
  render :show, locals: { user: }, status: :ok
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      render :new
    end
  end
  private
  def user_params
     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
