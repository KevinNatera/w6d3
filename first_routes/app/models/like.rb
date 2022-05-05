class Like < ApplicationRecord
    validates :user_id, presence: true

    belongs_to :user, dependent: :destroy
    belongs_to :likeable, polymorphic: true

    
end
