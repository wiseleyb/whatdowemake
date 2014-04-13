class FacebookEducation < ActiveRecord::Base
  belongs_to :user

  class << self
  def update_user(user, auth_hash)
      res = []
      if edus = auth_hash['extra'].try(:[], 'raw_info').try(:[], 'education')
        edus.each do |edu|
          if school = edu['school']
            fe = self.where(user_id: user.id,
                            school_fid: school['id']).first_or_initialize
            fe.school = school['name']
          end
          fe.type = edu['type']
          fe.save
          res << fe
        end
        # TODO: parse concentrations
      end
    end
    res
  end
end
