class ArtworkShare <  ApplicationRecord

    validates :artwork_id, uniqueness: {scope: :viewer_id}

    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id
        
    belongs_to :viewer,
        class_name: :User,
        foreign_key: :viewer_id
end