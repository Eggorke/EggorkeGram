module ApplicationHelper
   def ten_random_users
    offset = User.order("RANDOM()").limit(11)
    return offset
   end
end
