class User < ActiveRecord::Base
  validates_presence_of :name

  serialize :auth_hash

  # Facebook data
  has_one  :facebook_info
  has_one  :facebook_extra
  has_many :facebook_educations
  has_many :facebook_works

  def self.create_with_omniauth(auth)
    user = create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if info = auth['info']
         user.name = info['name'] || ""
         user.email = info['email'] || ""
     end
      if cred = auth['credentials']
        user.token = cred['token']
        user.token_expires_at = cred['expires_at']
      end
      user.auth_hash = auth
    end
    FacebookData.record_user(user, user.auth_hash)
    user
  end
end
