# Require external gems
require 'json'
require 'rest-client'

# All DBio functionality, whether extended or just here.
class DBio
  # Initialize the API. Not much here really.
  def initialize; end

  # Load a user
  # @param id [Integer, String] the user ID or name of the requested user.
  # @raise [RestClient::NotFound] if the specified user does not exist
  # @return [User] the new user object
  def user(id)
    user = JSON.parse(RestClient.get("https://api.discord.bio/v1/user/details/#{id}"))

    User.new(user['payload'])
  end
end

# Require files.
require 'dbio/discord_connection'
require 'dbio/discord_profile'
require 'dbio/user_connection'
require 'dbio/user'
