class CreateFacebookTables < ActiveRecord::Migration
  def change
    create_table :facebook_info do |t|
      t.references :user
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :url
      t.string :location
      t.bool   :verified
      t.string :city
      t.string :region
      t.string :country
      t.timestamps
    end

    add_index :facebook_info, :user_id

    create_table :facebook_extras do |t|
      t.references :user
      t.date       :birthday
      t.string     :gender
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

    create_table :facebook_education_conentrations do |t|
      t.references  :facebook_education
      t.integer     :concentration_uid
      t.string      :concentration
      t.timestamps
    end

    add_index :facebook_education_concentrations, :facebook_education_id

    create_table :facebook_works do |t|
      t.references :user
      t.integer    :employer_uid
      t.string     :employer
      t.integer    :location_uid
      t.string     :location
      t.string     :location_city
      t.string     :location_region
      t.string     :location_country
      t.integer    :position_uid
      t.string     :positiion
      t.date       :start_date
      t.date       :end_date
      # TODO: projects
      t.timestamps
    end

    add_index :facebook_works, :user_id
  end
end
