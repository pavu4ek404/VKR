class Well < ApplicationRecord
    belongs_to :cut 
    belongs_to :explosive
    has_many :works ,dependent: :destroy
    validates :name, uniqueness: true,presence: true
end
