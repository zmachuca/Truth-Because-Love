class User < ActiveRecord::Base
	has_one :charge
end
