require 'koala'

# get a Facebook access token from here
# https://developers.facebook.com/tools/explorer
# select "user_likes" when authenticating
oauth_access_token = 'AccessTokenGoesHere'
graph = Koala::Facebook::API.new(oauth_access_token)

# get all your likes
my_likes = []
my_page = graph.get_connections('me','likes')

begin
  my_likes += my_page
end while my_page = my_page.next_page

# print them all then print total likes
my_likes.each do |l|
  puts "#{l['name']} - http://www.facebook.com/#{l['id']} - #{l['created_time']}"
end

puts "Likes Total : #{my_likes.length}"

