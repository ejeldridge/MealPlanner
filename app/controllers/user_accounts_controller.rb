class UserAccountsController < ApplicationController

  def index
    @user = UserAccount.new()
  end

  def create
    error_occured = false
    @user = UserAccount.new()
    @user_accounts = UserAccount.all
    flash[:notice] = params.to_s
    if params[:user_account][:first_name].to_s.empty?
      flash[:error] = "First Name blank!"
      error_occured = true
    end
    if params[:user_account][:last_name].to_s.empty?
      flash[:error] = "Last Name blank!"
      error_occured = true
    end
    if params[:user_account][:email].to_s.empty?
      flash[:error] = "Email addresses blank!"
      error_occured = true
    end
    #TODO: Add better email format verification
    if params[:user_account][:email].to_s != params[:user_account][:confirm_email].to_s
      flash[:error] = "Email addresses did not match!"
      error_occured = true
    end
    if params[:user_account][:password].to_s.empty?
      flash[:error] = "Passwords empty!"  #TODO: Modify this to detect existing error and concatenate
      error_occured = true
    end
    if params[:user_account][:password].to_s != params[:user_account][:confirm_password].to_s
      flash[:error] = "Passwords did not match!"  #TODO: Modify this to detect existing error and concatenate
      error_occured = true
    end

    @user_accounts.each do |account|

    end

    if error_occured
      redirect_to root_url  #TODO:  replace with showing the form again
    else
      # flash[:notice] = "Everything looks ok."
      redirect_to root_url
    end


  end

  def show

  end
end
