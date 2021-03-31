# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
    Artwork.delete_all
    User.delete_all
    ArtworkShare.delete_all

    daniel = User.create(
        username: "danielwu1"        
    )

    jae = User.create(
        username: "jaewooklim"
    )

    ara = User.create(
        username: "aracho"
    )

    daniel_g = User.create(
        username: "danielgorter"
    )

    megan = User.create(
        username: "meganmcnulty"
    )

    artwork2 = Artwork.create(
        title: "starry night",
        image_url: "www.starrynight.com",
        artist_id: 1
    )

    artwork3 = Artwork.create(
        title: "blurry night",
        image_url: "www.blurrynight.com",
        artist_id: 1
    )

    artwork4 = Artwork.create(
        title: "nightly night",
        image_url: "www.nightlynight.com",
        artist_id: 1
    )

    artwork5 = Artwork.create(
        title: "starry night",
        image_url: "www.starrynighttwo.com",
        artist_id: 2
    )

    ArtworkShare.create(
        artwork_id: 1,
        viewer_id: 3
    )

    ArtworkShare.create(
        artwork_id: 1,
        viewer_id: 4
    )

    ArtworkShare.create(
        artwork_id: 2,
        viewer_id: 5
    )

    ArtworkShare.create(
        artwork_id: 3,
        viewer_id: 3
    )

    ArtworkShare.create(
        artwork_id: 4,
        viewer_id: 4
    )

end





