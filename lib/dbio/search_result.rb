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

  # @return [String] this result's discord username
  def discord_username
    @data['discord']['username']
  end

  # @return [String] this result's discord discriminator
  def discord_discriminator
    @data['discord']['discriminator']
  end

  # @return [Integer] this result's discord ID
  def discord_id
    @data['discord']['id'].to_i
  end

  # @return [String] this result's discord avatar hash
  def discord_avatar
    @data['discord']['avatar']
  end

  # @return [Boolean] if this user is verified
  def verified?
    @data['user']['verified'] == 1
  end

  # @return [Boolean] if this user is a discord.bio staff member
  def staff?
    @data['user']['staff']
  end

  # @return [Boolean] if this user is a premium user
  def premium?
    @data['user']['premium']
  end

  # @return [Integer] this user's upvotes
  def upvotes
    @data['user']['upvotes']
  end

  # @return [String] this user's description
  def description
    @data['user']['description']
  end

  # The user itself, for more detail
  # @return [User] the user
  def user
    user = JSON.parse(RestClient.get("https://api.discord.bio/v1/user/details/#{slug}"))

    DBio::User.new(user['payload'])
  end
end
