# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

User.destroy_all
User.create!([
    {
        first_name: "Tad",
        last_name: "Duval"
    },
    {
        first_name: "Peter",
        last_name: "Jackson"
    }
])
p "Created #{User.count} user(s)"

Author.destroy_all
Author.create!([
    {
        first_name: "William",
        last_name: "Shakespeare"
    },
    {
        first_name: "Yuval",
        last_name: "Harari"
    }
])
p "Created #{Author.count} author(s)"

first_author = Author.first
Book.destroy_all
Book.create!([
    {
        author_id: first_author.id,
        page_length: 100,
        genre: "Horror",
        supply: 100,
        title: "American Horror Story"
    },
    {
        author_id: first_author.id,
        page_length: 100,
        genre: "Drama",
        supply: 100,
        title: "Hamlet"
    }
])
p "Created #{Book.count} book(s)"

Wishlist.destroy_all
Wishlist.create!([
    {
        user_id: User.first.id
    },
    {
        user_id: User.second.id
    }
])
p "Created #{Wishlist.count} wishlist(s)"

Wish.destroy_all
Wish.create!([
    {
        wishlist_id: Wishlist.first.id,
        thing_type: 'Book',
        thing_id: Book.first.id
    },
    {
        wishlist_id: Wishlist.second.id,
        thing_type: 'Book',
        thing_id: Book.second.id
    }
])

p "Created #{Wish.count} wish(es)"