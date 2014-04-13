class CreateFacebookTables < ActiveRecord::Migration
  def change
  create_table :facebook_infos do |t|
      t.references :user
      t.string    :nickname
      t.string    :first_name
      t.string    :last_name
      t.string    :image
      t.string    :url
      t.string    :location
      t.boolean   :verified
      t.string    :city
      t.string    :region
      t.string    :country
      t.timestamps
    end

    add_index :facebook_infos, :user_id

    create_table :facebook_extras do |t|
      t.references :user
      t.date       :birthday
      t.string     :gender
      t.integer    :hometown_fid
      t.string     :hometown
      t.string     :hometown_city
      t.string     :hometown_region
      t.string     :hometown_country
      t.string     :link
      t.string     :locale
      t.string     :timezone
      t.string     :username
      t.timestamps
    end

    add_index :facebook_extras, :user_id

    create_table :facebook_educations do |t|
      t.references :user
      t.integer    :school_uid
      t.string     :school
      t.integer    :year
      t.string     :concentration
      t.string     :type
      t.timestamps
    end

    add_index :facebook_educations, :user_id

    create_table :facebook_education_concentrations do |t|
      t.references  :facebook_education
      t.integer     :concentration_fid
      t.string      :concentration
      t.timestamps
    end

  add_index :facebook_education_concentrations,
              :facebook_education_id,
              name: :fb_ed_con_on_fb_ed_id

    create_table :facebook_works do |t|
      t.references :user
      t.integer    :employer_fid
      t.string     :employer
      t.integer    :location_fid
      t.string     :location
      t.string     :location_city
      t.string     :location_region
      t.string     :location_country
      t.integer    :position_fid
      t.string     :positiion
      t.integer    :from_fid
      t.string     :from_name
      t.date       :start_date
      t.date       :end_date
      # TODO: projects
      # TODO: 'with' has_many
      t.timestamps
    end

    add_index :facebook_works, :user_id
  end
end
