class PersonsController < ApplicationController
  before_filter :authenticate_user!, :except => []
  
  def profile
    
  end
end
