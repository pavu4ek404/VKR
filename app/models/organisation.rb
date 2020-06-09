class Organisation < ApplicationRecord
    has_many :contracts,dependent: :destroy
    validates :name, uniqueness: true, presence: true
end
