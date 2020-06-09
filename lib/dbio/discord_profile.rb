# Find information about a Discord Profile.
class DBio::DiscordProfile
  # Initialize the profile
  def initialize(data)
    @data = data
  end

  # The id of the user.
  # @return [Integer] User ID in integer form.
  def id
    @user['id'].to_i
  end

  # @return [String] the username as it appears on Discord
  def username
    @data['username']
  end

  # @return [String] the avatar hash of this user
  def avatar_hash
    @data['avatar_hash']
  end

  # @return [String] this user's discriminator
  def discriminator
    @data['discriminator']
  end

  # @return [Integer] public flags provided via Oauth, not useful on their own.
  def public_flags
    @data['public_flags']
  end

  # @return [String] the user's name+discriminator. Same as it is in discordrb
  def distinct
    "#{username}\##{discriminator}"
  end
end
