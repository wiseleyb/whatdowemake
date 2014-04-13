class FacebookExtra < ActiveRecord::Base
  belongs_to :user

  class << self
  def update_user(user, auth_hash)
      if extra = auth_hash['extra'].try(:[], 'raw_info')
        fe = self.where(user_id: user.id).first_or_initialize
        fe.birthday     = Chronic.parse(extra['birthday']).try(:to_date)
        fe.gender       = extra['gender']
        if hometown = extra['hometown']
          fe.hometown_fid = hometown['id']
          fe.hometown     = hometown['name']
          fe.hometown_city, fe.hometown_region, fe.hometown_country =
            FacebookData.parse_facebook_location(fe.hometown)
        end
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
