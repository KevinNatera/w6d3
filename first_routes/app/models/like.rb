class Like < ApplicationRecord
    validates :user_id, presence: true
    # validates :artwork_id, uniqueness: { scope: :user_id }
    # validates :comment_id, uniqueness: { scope: :user_id }

    belongs_to :user, dependent: :destroy
    belongs_to :likeable, polymorphic: true

    
end
