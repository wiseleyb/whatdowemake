class FacebookData
  class << self
    def record_user_facebook_data(user, auth_hash)
      FacebookInfo.find_or_create_by_user(user, auth_hash)
      FacebookExtra.find_or_create_by_user(user, auth_hash)
      FacebookEducation.find_or_create_by_user(user, auth_hash)
      FacebookWork.find_or_create_by_user(user, auth_hash)
    end

    def parse_facebook_location(location)
      # TODO: implement this
      [location.split(','), 'US'].flatten.map(&:strip)
    end
  end
end
