module Mutations
  class DeletePost < GraphQL::Schema::RelayClassicMutation
    # rails g graphql:mutation delete_comment

    graphql_name 'DeletePostType'

    # description 'Delete post object'
    # # TODO: define return fields
    field :post, Types::PostType, null: true


    # # TODO: define arguments
    argument :id, ID, required: true

    # # TODO: define resolve method
    def resolve(id:)
        post = Post.where(id: id).first
        if post.present?
          post.destroy!
          {
            post: post
          }
        end
    end
  end
end
