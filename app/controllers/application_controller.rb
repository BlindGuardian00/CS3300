class ApplicationController < ActionController::Base
  before_action :authenticate_student!, :except => [:index, :show]
end

