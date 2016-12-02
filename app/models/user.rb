class User < ApplicationRecord

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
end
