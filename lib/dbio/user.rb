# Find information about users.
class DBio::User
  # Initialize the user
  def initialize(data)
    @user = data['user']['details']
    @discord = data['discord']
    @discord_connections = data['user']['discordConnections']
    @user_connections = data['user']['user_connections']
  end

  # @return data in raw json form.
  attr_reader :data

  alias_method :to_s, :data

  # The slug of this user. Use: dsc.bio/slug
  # @see User#profile_url
  # @return [String] the slug
  def slug
    @user['slug']
  end

  # The link to this user's profile
  # @return [String] this user's profile
  def profile_url
    "https://dsc.bio/#{profile_url}"
  end

  # The id of the user.
  # @return [Integer] User ID in integer form.
  def id
    @user['user_id'].to_i
  end

  # @return [Integer] the amount of upvotes this user has.
  def upvotes
    @user['upvotes']
  end

  # The oauth flags for this user. Not useful on their own.
  # @see DBio::DiscordProfile#public_flags
  # @return [Integer] the flags for this user
  def flags
    @user['flags']
  end

  # @return [boolean] if this user is verified
  def verified?
    @user['verified'] == 1
  end

  # @return [Time] The time this user was created
  def created
    Time.parse(@user['created_at'])
  end

  # @return [String, nil] the description for this user, if one is set.
  def description
    @user['description']
  end

  # @return [String, nil] the location for this user, if one is set.
  def location
    @user['location']
  end

  # The API returns an integer, so this is converted to a String.
  # @return [String, nil] the gender of this user in String form.
  def gender
    case @user['gender']
    when 0
      "Male"
    when 1
      "Female"
    when 2
      "Non-Binary"
    when nil
      "Undisclosed"
    else
      nil
    end
  end

  # @return [Date, nil] the birthdate of this user, if one is set
  def birthday
    Date.parse(@user['birthday'])
  end

  # @return [String, nil] the user's email, if one is set
  def email
    @user['email']
  end

  # @return [String, nil] the user's occupation, if one is set
  def occupation
    @user['occupation']
  end

  # @return [String, nil] the user's banner, if one is set
  def banner_url
    @user['banner']
  end

  # @return [Boolean] the user's premium status
  def premium?
    @user['premium']
  end

  # @return [Boolean] the user's staff status
  def staff?
    @user['staff']
  end

  # This is the user's Discord connections as they appear on their Discord profile
  # @return [Array<DiscordConnection>] the user's discord connections
  def discord_connections
    @discord_connections.map{ |e| DBio::DiscordConnection.new(e) }
  end

  # The user's Discord.Bio connections. Not as specific.
  # @return [Array<UserConnection>] the user's discord.bio connections
  def user_connections
    @user_connections.map { |e, f| DBio::UserConnection.new({ "type": e, "name": f }) }
  end

  # The user's Discord profile information, not overly specific either.
  # I instead recommend just getting it though your Discord Library with the ID
  # @see [User#id]
  def discord_profile
    DBio::DiscordProfile.new(@discord)
  end
end
