module Types
  class UserType < Types::BaseObject
    graphql_name 'UserType'
    description 'User object'

    field :id, ID, null: true
    field :name, String, null: true
    field :email, String, null: true
  end
end
