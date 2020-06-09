class Explosive < ApplicationRecord
    has_many :wells, dependent: :destroy
    has_many :contracts
    validates :name, uniqueness: true, presence: true
    validates :oxygen,:heat,:speed, presence: true
end
