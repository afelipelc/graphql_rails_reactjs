module Types
  class PostType < Types::BaseObject
    # rails g graphql:object Post title:String content:String id:ID
    graphql_name 'PostType'
    description 'Post object'

    field :title, String, null: true
    field :content, String, null: true
    field :id, ID, null: true
  end
end
