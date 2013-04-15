class UserSession
  def initialize(session)
    @session = session
  end

  def user_id
    return @session[:user_id]
  end

  def user_exists?
    return @session.has_key? :user_id
  end
end

