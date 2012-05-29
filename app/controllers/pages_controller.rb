class PagesController < ApplicationController
  def home
  end
  
  def rules
    @title = 'rules'
    
    @action_name = 'rules'
  end
end
