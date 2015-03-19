require 'csv'
require_relative '../app/models/congressmember'

class SunlightLegislatorsImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/legislators.csv")
    
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      newhash ={}
      row.each do |field, value|
        newhash[field] = value
        # create a hash for each senator, then create senator
      end
      Congressmember.create(newhash)
    end
  end
end