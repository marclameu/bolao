class HomeController < ApplicationController
  def index
    @groups = Group.actives  
  end
end
