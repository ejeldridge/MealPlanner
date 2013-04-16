class UserSession
  def initialize(session)
    @session = session
    @session[:user_id] = UserAccount.find_all_by_user_name(@session[:user_name])
  end

  def show_user_name
    return @session[:user_name]
  end

  def show_user_id
    return @session[:user_id]
  end
end

