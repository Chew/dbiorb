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
    user = JSON.parse(RestClient.get("https://api.discord.bio/user/details/#{id}"))

    User.new(user['payload'])
  end

  # Returns the users by most likes.
  # Their data is short, so it's not really worth storing a lot of data
  # @see [SearchResult#user]
  # @return [Array<SearchResult>] the response
  def top_likes
    JSON.parse(RestClient.get("https://api.discord.bio/topLikes"))['payload'].map { |e| SearchResult.new(e) }
  end

  # Searches for a user
  # This API is not publicly documented and can break at any time. Be careful!
  # @return [Array<SearchResult>] the response
  def search(user)
    JSON.parse(RestClient.get("https://api.discord.bio/user/search/#{user}"))['payload'].map { |e| SearchResult.new(e) }
  end
end

# Require files.
require 'dbio/discord_connection'
require 'dbio/discord_profile'
require 'dbio/search_result'
require 'dbio/user_connection'
require 'dbio/user'
