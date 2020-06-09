class Prof < ApplicationRecord    
    has_many :allpeopls, dependent: :destroy
    belongs_to :peopl
    validates :name_prof,uniqueness: true, presence: true
   
end
