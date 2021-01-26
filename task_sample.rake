require './lib/tasks/create_sample_data'

namespace :task_sample do
  desc 'add sample data'
  task add_sample_data: :environment do
    user_factory = UserFactory.new
    tweet_factory = TweetFactory.new
    user_factory.create
    tweet_factory.create
    # puts result1.error
  end

  task export_sample_data: :environment do
    userdata = User.last(1)
    tweetdata = Tweet.last(1)
    puts userdata[0].created_at
    puts tweetdata[0].created_at
  end
end
