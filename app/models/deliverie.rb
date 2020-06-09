class Deliverie < ApplicationRecord
    belongs_to :contract
    belongs_to :storehouse
    validates :time, presence: true

    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |deli|
            csv << deli.attributes.values_at(*column_names)
          end
        end
    end
    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        Deliverie.create! row.to_hash
      end
    end
end 