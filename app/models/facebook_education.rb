class FacebookEducation < ActiveRecord::Base
  belongs_to :user

  class << self
    def find_or_create_by_user(user, auth_hash)
      res = []
      if edus = auth_hash['extra'].try(:[], 'raw_info').try(:[], 'education')
        edus.each do |edu|
          fe = self.find_or_create_by_user_id(user.id)
          if school = edu['school']
            fe.school_uid = school['id']
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
