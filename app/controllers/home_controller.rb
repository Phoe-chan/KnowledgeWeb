class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    #Default method, no processing
  end
end
