 class User
  def initialize(name)
    @name = name
  end
 end
 
 class Tweet
  def initialize(tweet)
    @tweet = tweet
  end
 end
 
 class SampleDataFactory
  def initialize(data_number)
    @sampledata = []
    data_number.times do |i|
      data = {username:User.new(i), tweet:Tweet.new(i)}
      @sampledata << data
    end
  end
 end

 class UserFactory < SampleDataFactory
  def create
    User.create
  end
 end

 class TweetFactory < SampleDataFactory
  def create
    Tweet.create
  end
 end

user = UserFactory.new(10)
user.create

tweet = TweetFactory.new(10)
tweet.create
