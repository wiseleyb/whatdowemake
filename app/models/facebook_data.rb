class FacebookData
  class << self
  def record_user(user, auth_hash)
      puts 'fb info'
      FacebookInfo.update_user(user, auth_hash)
      puts 'fb extra'
      FacebookExtra.update_user(user, auth_hash)
      puts 'fb education'
      FacebookEducation.update_user(user, auth_hash)
      puts 'fb work'
      FacebookWork.update_user(user, auth_hash)
    end

    def parse_facebook_location(location)
      # TODO: implement this
     return unless location
      [location.split(','), 'US'].flatten.map(&:strip)
    end

    def destory_facebook_data(user)
      user.facebook_info.destroy_all
      user.facebook_extra.destroy_all
      user.facebook_education.destroy_all
      user.facebook_work.destroy_all
    end
  end
end
