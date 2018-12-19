module Types
  class AuthProviderEmailInputType < Types::BaseInputObject
    graphql_name 'AUTH_PROVIDER_EMAIL'
    description 'Authentication provider'

    argument :email, String, required: true
    argument :password, String, required: true
  end
end
