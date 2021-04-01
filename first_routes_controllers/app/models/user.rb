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
        through: :artworks,
        source: :artwork_shares

    has_many :comments,
        foreign_key: :commenter_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :artworks_comments,
        through: :artworks,
        source: :comments,
        dependent: :destroy 

end