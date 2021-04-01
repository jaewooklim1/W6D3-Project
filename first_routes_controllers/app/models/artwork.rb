class Artwork < ApplicationRecord

    validates :artist_id, uniqueness: {scope: :title}

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User  

    has_many :artwork_shares,
        class_name: :ArtworkShare,
        foreign_key: :artwork_id

    has_many :shared_viewers,
        through: :artists,
        source: :views

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :commented_users,
        through: :comments,
        source: :commenter
end