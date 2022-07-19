class Book < ApplicationRecord
    validates :name, presence: true, length: {minimum:3}
    validates :description,presence: true

    belongs_to :user
    
end