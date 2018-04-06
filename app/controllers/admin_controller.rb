class AdminController < ApplicationController
  before_action :authentication_admin!
  def index
  end
end
