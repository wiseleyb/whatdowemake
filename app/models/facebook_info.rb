class FacebookInfo < ActiveRecord::Base
  class << self
    def find_or_create_by_user(user, auth_hash)
      if info = auth_hash['info']
        fi = self.find_or_create_by_user_id(user.id)
        #<OmniAuth::AuthHash::InfoHash email="wiseleyb@gmail.com"
        #first_name="Ben" image="http://graph.facebook.com/524355608/picture"
        #last_name="Wiseley" location="San Francisco, California" name="Ben
        #Wiseley" nickname="wiseleyb" urls=#<OmniAuth::AuthHash
        #Facebook="https://www.facebook.com/wiseleyb"> verified=true>"
        fi.nickname     = info['nickname']
        fi.first_name   = info['first_name']
        fi.last_name    = info['last_name']
        fi.image        = info['image']
        # TODO - convert this to sub-table
        fi.url          = info['urls'].try(:[], 'Facebook')
        fi.location     = info['location']

        fi.city, fi.region, fi.country =
          FacebookData.parse_facebook_location(fi.location)

        fi.save
        fi
    end
  end
end
