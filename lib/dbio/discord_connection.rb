# Find information about a Discord Connection.
class DBio::DiscordConnection
  # Initialize the connection
  def initialize(data)
    @data = data
  end

  # The type of Discord connection, e.g. Twitter, YouTube, etc.
  # @return [String] the type of connection
  def type
    @data['connection_type']
  end

  # @return [String] the name as it appears on the Discord profile
  def name
    @data['name']
  end

  # @return [String] the URL to the connection as it is on the Discord profile
  def url
    @data['url']
  end
end
