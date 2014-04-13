class FacebookWork < ActiveRecord::Base
  belongs_to :user

  class << self
    def find_or_create_by_user(user, auth_hash)
      res = []
      if works = auth_hash['extra'].try(:[], 'raw_info').try(:[], 'work')
        works.each do |work|
          fw = self.find_or_create_by_user_id(user.id)
          if emp = work['employer']
            fw.employer_uid   = emp['id']
            fw.employer       = emp['name']
          end
          if loc = work['location']
            fw.location_uid = loc['id']
            fw.location = loc['name']
            fw.location_city, fw.location_region, fw.location_state =
              FacebookData.parse_facebook_location(loc['name'])
          end
          if pos = work['position']
            fw.position_uid = pos['id']
            fw.position = pos['name']
          end
          fw.start_date = Chronic.parse(work['start_date']).try(:to_date)
          fw.end_date   = Chronic.parse(work['end_date']).try(:to_date)
          fw.save
          res << fw
        end
      end
      res
    end
  end
end
