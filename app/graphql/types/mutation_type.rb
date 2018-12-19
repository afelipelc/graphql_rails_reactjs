module Types
  class MutationType < GraphQL::Schema::Object
    field :signInUser, mutation: Mutations::SignInUser
    field :createUser, mutation: Mutations::CreateUser
    field :createPost, mutation: Mutations::CreatePost
    #field :deleteComment, mutation: Mutations::DeleteComment
    field :deletePost, mutation: Mutations::DeletePost
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
