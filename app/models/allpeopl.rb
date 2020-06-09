class Allpeopl < ApplicationRecord
    belongs_to :peopl
    belongs_to :sert
    belongs_to :prof

    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |allpeopl|
            csv << allpeopl.attributes.values_at(*column_names)
          end
        end
    end

    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        Allpeopl.create! row.to_hash
      end
    end
end
