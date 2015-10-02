class Strain < ActiveRecord::Base
	has_many :plants


	#redefinimos el metodo to_param
	 def to_param
	    name
	 end
end
