class Comment < ApplicationRecord

    belongs_to :commenter,
        class_name: :User,
        foreign_key: :commenter_id      

    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id 

    has_many :likes,
        foreign_key: :likeable_id,
        class_name: :Like,
        as: :likeable
        
    has_many :likers,
        through: :likes,
        source: :user

        
end