class User < ActiveRecord::Base

  def self.from_omniauth(auth_hash)
    where(auth_hash.slice("provider", "uid")).first || create_new_user(auth_hash)
  end

  def self.create_new_user(auth_hash)
    raise auth_hash
  end

end
