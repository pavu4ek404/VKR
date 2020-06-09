class Storehouse < ApplicationRecord
    has_many :contracts,dependent: :destroy
    has_many :deliceries
    belongs_to :peopl
    belongs_to :peopl1, class_name: "Peopl"
    belongs_to :requirement
    belongs_to :cut
    validates  :name, uniqueness: true, presence: true
end
