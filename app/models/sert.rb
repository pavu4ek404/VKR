class Sert < ApplicationRecord
   has_many :allpeopls,dependent: :destroy
   belongs_to :peopl
   validates :name_sert, uniqueness: true,presence: true
end
