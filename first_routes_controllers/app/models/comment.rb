# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  commenter_id :integer          not null
#  artwork_id   :integer          not null
#  body         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
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
