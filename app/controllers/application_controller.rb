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
    if !user_found
      flash[:error] = "User '" + params[:user_name].to_s + "' not found!"
      redirect_to root_url
    elsif !good_login
      flash[:error] = "Password did not match"
      redirect_to root_url
    else
      o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
      session_id  =  (0...50).map{ o[rand(o.length)] }.join
      session[:user] = params[:user_name]
      my_account = UserAccount.find_by_user_name(params[:user_name])
      my_account.session = session_id
      my_account.session_expire = Time.now + 3600
      my_account.save
      flash[:notice] = "Welcome back " + my_account.first_name
      redirect_to root_url
    end


  end

  def logout
    session.clear
    flash[:notice] = "You have logged out."
    redirect_to root_url
  end
end
