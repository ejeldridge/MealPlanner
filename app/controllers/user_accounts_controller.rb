require 'digest/sha2'
class UserAccountsController < ApplicationController

  def index
    @user = UserAccount.new()
  end

  def create
    error_occured = false
    @user = UserAccount.new()
    @user_accounts = UserAccount.all
    flash[:error] = ""
    if params[:user_account][:first_name].to_s.empty?
      flash[:error] += "First Name blank!    "
      error_occured = true
    end
    if params[:user_account][:last_name].to_s.empty?
      flash[:error] += "Last Name blank!    "
      error_occured = true
    end
    if params[:user_account][:email].to_s.empty?
      flash[:error] += "Email addresses blank!    "
      error_occured = true
    end
    #TODO: Add better email format verification
    if params[:user_account][:email].to_s != params[:user_account][:confirm_email].to_s
      flash[:error] += "Email addresses did not match!    "
      params[:user_account][:confirm_email] = ''
      error_occured = true
    end
    if params[:user_account][:password].to_s.empty?
      flash[:error] += "Passwords empty!    "  #TODO: Modify this to detect existing error and concatenate
      error_occured = true
    end
    if params[:user_account][:password].to_s != params[:user_account][:confirm_password].to_s
      flash[:error] += "Passwords did not match!    "  #TODO: Modify this to detect existing error and concatenate
      error_occured = true
    end

    @user_accounts.each do |account|
      if params[:user_account][:user_name] == account.user_name
        flash[:error] += "User Name in use!    "  #TODO: Modify this to detect existing error and concatenate
        params[:user_account][:user_name] = ''
        error_occured = true
      end
    end

    if error_occured
      #redirect_to root_url  #TODO:  replace with showing the form again
      redirect_to user_accounts_path(@post, :params => params)
    else
      @user.first_name = params[:user_account][:first_name].to_s
      @user.last_name = params[:user_account][:last_name].to_s
      @user.user_name = params[:user_account][:user_name].to_s
      @user.email = params[:user_account][:email].to_s
      o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
      @user.salt  =  (0...50).map{ o[rand(o.length)] }.join
      #TODO: Improve password hash
      @user.password_hash = Digest::SHA2.hexdigest(@user.salt + params[:user_account][:password].to_s)
      @user.save
      flash[:notice] = "User '" + @user.user_name.to_s + "' created."
      session_id  =  (0...50).map{ o[rand(o.length)] }.join
      my_account = UserAccount.find_by_user_name(@user.user_name)
      my_account.session = session_id
      my_account.session_expire = Time.now + 3600
      my_account.save
      session[:user_id] = my_account.id
      redirect_to root_url
    end


  end

end
