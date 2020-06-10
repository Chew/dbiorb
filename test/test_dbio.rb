require 'minitest/autorun'
require 'dbio'

# We require rest-client so we can manually get the data from the API ourselves.
# Then we compare it to what the gem gives us.
require 'rest-client'

class DBioTest < Minitest::Test
  def test_user
    dbio = DBio.new
    id = 476488167042580481
    user = dbio.user(id)
    url = "https://api.discord.bio/v1/user/details/#{id}"
    data = JSON.parse(RestClient.get(url))['payload']

    assert_equal user.description,
                 data['user']['details']['description']
    assert_equal user.discord_connections[0].type,
                 data['user']['discordConnections'][0]['connection_type']
  end
end
