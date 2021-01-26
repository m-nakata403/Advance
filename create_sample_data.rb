require 'securerandom'

# Factoryの親クラス
class Factory
  def create
    raise 'ERROR: called abstract method [create]'
  end

  private

  # ランダムのアルファベットを生成
  def random_string
    ('A'..'Z').to_a.sample(5).join
  end

  # ランダムのhex15桁を生成
  def password
    SecureRandom.hex(15)
  end

  # ランダムのアドレスを生成
  def mail_address
    "#{SecureRandom.hex(10)}@sample.com"
  end
end

class UserFactory < Factory
  def create
    params = { nickname: random_string, password: password, email: mail_address }
    User.create(params)
  end
end

class TweetFactory < Factory
  def create
    params = { text: random_string, image: random_string }
    Tweet.create(params)
  end
end

