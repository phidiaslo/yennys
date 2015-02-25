class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_header_variable

  def set_header_variable
    @categories = Category.all.order(:name)
    @locations = Location.all.order(:name)
  end

end
