module Types
  class SignInType < Types::BaseObject
    graphql_name 'SignInType'
    description 'SignIn object'

    field :token, String, null: false
    field :user, Types::UserType, null: false
  end
end
