class FacebookExtra < ActiveRecord::Base
  belongs_to :user

  class << self
    def find_or_create_by_user(user, auth_hash)
      if extra = auth_hash['extra'].try(:[], 'raw_info')
        fe = self.find_or_create_by_user_id(user.id)
        fe.birthday     = Chronic.parse(extra['birthday']).try(:to_date)
        fe.gender       = extra['gender']
        fe.hometown     = extra['hometown']
        fe.hometown_city, fe.hometown_region, fe.hometown_country =
          FacebookData.parse_facebook_location(fe.hometown)
        fe.link         = extra['link']
        fe.locale       = extra['locale']
        fe.timezone     = extra['timezone']
        fe.username     = extra['username']
        fe.save
        fe
      end
    end
  end
end
