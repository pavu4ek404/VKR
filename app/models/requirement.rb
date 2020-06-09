class Requirement < ApplicationRecord
    has_many :storehouses
    validates :requi1,:requi2,:requi3,:requi4 ,:name,  presence: true
    validates :name, uniqueness: true
end
