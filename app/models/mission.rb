class Mission < ApplicationRecord
    belongs_to :scientist
    belongs_to :planet

    validates :name, presence: true
    validates :scientist, presence: true, uniqueness: {scope: :planet, message: "this scientist has already visited this planet"}
    validates :planet, presence: true
end
