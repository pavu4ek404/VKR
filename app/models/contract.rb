class Contract < ApplicationRecord
    has_many :deliceries
    belongs_to :organisation
    belongs_to :explosive
    validates :coutn,:price, :name, presence: true
    validates  :name, uniqueness: true
end
