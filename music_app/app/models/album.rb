class Album < ApplicationRecord
    validates :title, :year, null: false
    valides :live, inclusion: { in: [true, false] }
    belongs_to :band
end
