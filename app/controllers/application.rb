# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  include AuthenticatedSystem # for authentication
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'fcb5f37f244947d50cdcc1aa1dd89f6a'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  private
  
  
  def list_classes
    @player_classes = ['Marauder','Chosen','Zealot','Magus','Sorcerer/ess','Witch Elf','Disciple of Khaine','Shaman','Squig Herder','Black Orc','Witch Hunter','War Priest','Bright Wizard','Iron Breaker','Engineer','Rune Priest']  
  end
  
  def list_avatars    
    @image_array = []
    Dir.foreach("public/images/avatars") do |file|
      unless File::directory?(file)
        @image_array << file
      end    
    end
    @image_array
  end
end