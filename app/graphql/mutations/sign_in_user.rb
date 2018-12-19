module Mutations
  class SignInUser < GraphQL::Schema::RelayClassicMutation
    graphql_name 'SignInUser'
    description 'SinIn user with email and password'
    
    field :auth_user, Types::SignInType, null: true

    argument :auth, Types::AuthProviderEmailInputType, required: true  

    def resolve(auth:)
      puts auth
      return unless auth.email
      user = User.find_by email: auth.email

      # ensures we have the correct user
      return unless user
      return unless user.authenticate(auth.password)
      

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      # For Ruby on Rails >=5.2.x use:
      # crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")
      
      context[:current_user] = user # user session
      context[:session][:token] = token

      {
        auth_user: {
          user: user,
          token: token
        }
      }
    end
  end
end
