class Work < ApplicationRecord
    belongs_to :well
    belongs_to :peopl
    belongs_to :peopl1, class_name: "Peopl"
    validates :time,:quantity, presence: true
    
    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |work|
            csv << work.attributes.values_at(*column_names)
          end
        end
    end
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Work.create! row.to_hash
    end
  end
end
