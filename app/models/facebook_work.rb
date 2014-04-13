class FacebookWork < ActiveRecord::Base
  belongs_to :user

  class << self
  def update_user(user, auth_hash)
      res = []
      if works = auth_hash['extra'].try(:[], 'raw_info').try(:[], 'work')
        works.each do |work|
          if emp = work['employer']
            fw = self.where(user_id: user.id,
                            employer_fid: emp['id']
                           ).first_or_initialize
            fw.employer       = emp['name']
            if loc = work['location']
              fw.location_fid = loc['id']
              fw.location = loc['name']
              fw.location_city, fw.location_region, fw.location_state =
                FacebookData.parse_facebook_location(loc['name'])
            end
            if pos = work['position']
              fw.position_fid = pos['id']
              fw.position = pos['name']
            end
            if from = work['from']
              fw.from_fid = pos['id']
              fw.from_name = pos['name']
            end
            # TODO: I think 'with' is a has_many
            # if with = work['with']
            #   fw.with_fid = pos['id']
            #   fw.with_name = pos['name']
            # end
            fw.start_date = Chronic.parse(work['start_date']).try(:to_date)
            fw.end_date   = Chronic.parse(work['end_date']).try(:to_date)
            fw.save
            res << fw
          end
        end
      end
      res
    end
  end
end
