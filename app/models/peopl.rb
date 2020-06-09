class Peopl < ApplicationRecord
    has_many :works
    has_many :others, class_name:"Work", foreign_key: "peopl1_id"
    has_many :serts 
    has_many :profs
    has_many :storehouses
    has_many :othetsstore, class_name: "Storehouse",foreign_key: "peopl1_id"
    validates :fn,:sn,:tn,:dolj, presence: true

    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |peopl|
            csv << peopl.attributes.values_at(*column_names)
          end
        end
    end
    
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
          Peopl.create! row.to_hash
        end
      end
end
