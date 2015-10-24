class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @event = Event.new(when: Time.current)
  end

  def submit_and_error
    @event = Event.new(params.require(:event).permit!)
    render :index
  end
end
