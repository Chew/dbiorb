# Find information about a Discord.Bio Connection.
class DBio::UserConnection
  # Initialize the connection
  def initialize(data)
    @data = data
  end

  # The type of connection, e.g. Twitter, YouTube, etc.
  # @return [String] the type of connection
  def type
    @data['type']
  end

  # @return [String] the name as it appears on the User profile
  def name
    @data['name']
  end
end
