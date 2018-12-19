module Mutations
  class CreateUser < GraphQL::Schema::RelayClassicMutation
    graphql_name 'CreateUserType'
    description 'Authentication provider'

    # fields or arguments must not be in camel case, sample: auth_provider
    field :user, Types::UserType, null: true

    argument :name, String, required: true
    argument :auth_provider, Types::AuthProviderEmailInputType, required: true  

    def resolve(name:, auth_provider:)
      puts name
      user = User.create!(
        name: name,
        email: auth_provider.email,
        password: auth_provider.password
      )
      {
        user: user
      }
    end
  end
end
