# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
    User.delete_all
    Artwork.delete_all
    ArtworkShare.delete_all
    Comment.delete_all 
    Like.delete_all 

    user1 = User.create(
      id: 1,
      username: "bob"
    )
  
    user2 = User.create(
      id: 2,
      username: "donald"
    )

    user3 = User.create(
        id: 3,
        username: "obo"
    )
    
    user4 = User.create(
        id: 4,
        username: "not_bob"
    )
    
    art1 = Artwork.create(
        id: 1,
        artist_id: 1,
        title: "first",
        image_url: "wefijbnweogfwoemf"
    )

    art2 = Artwork.create(
        id: 2,
        artist_id: 1,
        title: "second",
        image_url: "wefi232r312fwoemf"
    )

    art3 = Artwork.create(
        id: 3,
        artist_id: 2,
        title: "third",
        image_url: "wefuhewbfi31emf"
    )

    art4 = Artwork.create(
        id: 4,
        artist_id: 2,
        title: "fourth",
        image_url: "43r13re432emf"
    )

    share1 = ArtworkShare.create(
        id: 1,
        artwork_id: 1,
        viewer_id: 1
    )

    share2 = ArtworkShare.create(
        id: 2,
        artwork_id: 2,
        viewer_id: 1
    )

    share3 = ArtworkShare.create(
        id: 3,
        artwork_id: 3,
        viewer_id: 1
    )

    share4 = ArtworkShare.create(
        id: 4,
        artwork_id: 4,
        viewer_id: 2
    )

    comment1 = Comment.create(
        id: 1,
        user_id: 1,
        artwork_id: 1,
        body: "I'M THE GREATEST"
    )

    comment2 = Comment.create(
        id: 2,
        user_id: 1,
        artwork_id: 1,
        body: "I SWEAR"
    )
    comment3 = Comment.create(
        id: 3,
        user_id: 1,
        artwork_id: 4,
        body: "ur trash"
    )
    
    comment4 = Comment.create(
        id: 4,
        user_id: 2,
        artwork_id: 4,
        body: "bruh"
    )

    like1 = Like.create(
        id: 1,
        user_id: 1,
        likeable_id: comment1.id,
        likeable_type: Comment
    )

    like2 = Like.create(
        id: 2,
        user_id: 2,
        likeable_id: comment1.id,
        likeable_type: Comment
    )

    like3 = Like.create(
        id: 3,
        user_id: 3,
        likeable_id: comment1.id,
        likeable_type: Comment
    )

    like4 = Like.create(
        id: 4,
        user_id: 1,
        likeable_id: comment2.id,
        likeable_type: Comment
    )

    like5 = Like.create(
        id: 5,
        user_id: 2,
        likeable_id: art1.id,
        likeable_type: Artwork
    )


    #total likes
    #bob (user1) has 3 likes on comment 1, 1 like on art 1
    #user2 has 1 like on artwork4

  end
