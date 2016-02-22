class User < ActiveRecord::Base
#Override Rails default table and primary key names
	self.table_name = "ng_users"
	self.primary_key = "ng_users_id"

#write authentication function to make sure user exists and password matches
	def self.authenticate(username="", login_password="")
	  user = User.find_by_username(username)
	  if user && user.match_password(login_password)
	    return user
	  else
	    return false
	  end
	end   
	def match_password(login_password="")
	  login_password == password
	  #Come back to add cryptography
	end
	#REFERENCE http://www.sitepoint.com/rails-userpassword-authentication-from-scratch-part-i/
end
