# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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

    has_many :likes,
        foreign_key: :likeable_id,
        class_name: :Like,
        as: :likeable

    has_many :likers,
        through: :likes,
        source: :user
    
        

end
