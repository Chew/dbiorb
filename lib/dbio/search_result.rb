# A shorter version of a user's details
class DBio::SearchResult
  # Initialize the result
  def initialize(data)
    @data = data
  end

  # The slug of this result's user.
  def slug
    @data['user']['slug']
  end

  # The user itself, for more detail
  # @return [User] the user
  def user
    user = JSON.parse(RestClient.get("https://api.discord.bio/v1/user/details/#{slug}"))

    DBio::User.new(user['payload'])
  end
end
