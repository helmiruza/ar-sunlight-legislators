require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateCongressmembers < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :congressmembers do |s|
      s.string :title
      s.string :firstname
      s.string :middlename
      s.string :lastname
      s.string :name_suffix
      s.string :nickname
      s.string :party
      s.string :state
      s.string :district
      s.string :in_office
      s.string :gender
      s.string :phone
      s.string :fax
      s.string :website
      s.string :webform
      s.string :congress_office
      s.string :bioguide_id
      s.string :votesmart_id
      s.string :fec_id
      s.string :govtrack_id
      s.string :crp_id
      s.string :twitter_id
      s.string :congresspedia_url
      s.string :youtube_url
      s.string :facebook_id
      s.string :official_rss
      s.string :senate_class
      s.string :birthdate

      s.timestamps null: false
    end
  end
end
