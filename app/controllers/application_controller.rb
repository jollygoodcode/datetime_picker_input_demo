class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_action :use_current_timezone

  def index
    @event = Event.new(when: nil)
  end

  def submit_and_error
    @event = Event.new(params.require(:event).permit!)
    render :index
  end

  private

    def use_current_timezone(&block)
      Time.use_zone(current_timezone, &block)
    end

    def current_timezone
      ENV.fetch('CURRENT_TIMEZONE') { 'Singapore' }
    end
end
