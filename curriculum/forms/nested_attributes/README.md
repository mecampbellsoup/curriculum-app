## Accepts Nested Attributes For

1) Given that:

- Comment belongs_to :post
- Post has_many :comments
- Post accepts_nested_attributes_for :comments

Create the posts form, and edit the posts controller, so that you can add a comment when creating a new post. In other words: allow users to create new comments at the same time they create posts.