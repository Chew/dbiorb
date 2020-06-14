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

  # The icon is used on the website, it's a Font Awesome icon code.
  # Not really useful unless you're making a site with the gem, in which case you'd probably do:
  # <a href="<%= @connection.url %>"><i class="<%= @connection.icon %>"></i> <%= @connection.name %></a>
  # Which could return:
  # <a href="https://twitter.com/twitter"><i class="fab fa-twitter"></i> Twitter</a>
  # @return [String] the font awesome icon code for this connection
  def icon
    @data['icon']
  end
end
