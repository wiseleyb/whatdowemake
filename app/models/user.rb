class User < ActiveRecord::Base
  validates_presence_of :name

  def self.create_with_omniauth(auth)
    create! do |user|
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
    end
    FacebookData.record_user(user, auth_hash)
    user
  end
end
