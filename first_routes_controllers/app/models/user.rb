class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        primary_key: :id, 
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy

    has_many :views,
        class_name: :ArtworkShare,
        foreign_key: :viewer_id,
        dependent: :destroy

    has_many :shared_artworks,
        through: :views,
        source: :artwork

    has_many :comments,
        foreign_key: :commenter_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :artworks_comments,
        through: :artworks,
        source: :comments,
        dependent: :destroy 

    has_many :liked_comments,
        through: :comments,
        source: :likes,
        dependent: :destroy 

    has_many :liked_artworks,
        through: :artworks,
        source: :likes, 
        dependent: :destroy

    
    

end