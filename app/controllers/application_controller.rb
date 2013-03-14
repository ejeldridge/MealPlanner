class ApplicationController < ActionController::Base
  protect_from_forgery

  def login
    @user_accounts = UserAccount.all
    user_found, good_login = false, false
    @user_accounts.each do |account|
      if account.user_name == params[:user_name]
        user_found = true
        password_check = Digest::SHA2.hexdigest(account.salt + params[:password].to_s)
        if account.password_hash == password_check
          good_login = true
        end
      end
    end
    if user_found != true
      flash[:error] = "User '" + params[:user_name].to_s + "' not found!"
      redirect_to root_url
    elsif good_login != true
      flash[:error] = "Password did not match"
      redirect_to root_url
    else
      flash[:notice] = "Login Valid"
      redirect_to root_url
    end


  end
end
