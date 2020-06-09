class Cut < ApplicationRecord
    has_many :wells, dependent: :destroy
    has_many :cuts
    validates :name, uniqueness: true, presence: true
end
