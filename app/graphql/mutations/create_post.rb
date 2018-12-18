module Mutations
  class CreatePost < GraphQL::Schema::RelayClassicMutation
    graphql_name 'CreatePostType'
    # TODO: define return fields
    field :post, Types::PostType, null: true
    

    # TODO: define arguments
    argument :title, String, required: true
    argument :content, String, required: true

    # TODO: define resolve method
    def resolve(title:, content:)
      puts content
      post = Post.create(title: title, content: content)
      {
        post: post
      }
    end
  end
end
