helpers do
  def current_skipper
    @current_skipper ||= Skipper.find_by(id: session[:skipper_id])
  end

  def logged_in?
    !!current_skipper
  end
end