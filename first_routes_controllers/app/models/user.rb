class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        primary_key: :id, 
        foreign_key: :artist_id,
        class_name: :Artwork 

    has_many :views,
        class_name: :ArtworkShare,
        foreign_key: :viewer_id

    has_many :shared_artworks,
        through: :artworks,
        source: :artwork_shares

end