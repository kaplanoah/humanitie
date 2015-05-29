class User < ActiveRecord::Base
  has_many :selfies, dependent: :destroy
  has_many :selfie_pairs, dependent: :destroy

  def self.from_omniauth(auth_hash)
    where(auth_hash.slice("provider", "uid")).first || create_new_user(auth_hash)
  end

  def self.create_new_user(auth_hash)
    params = {
      provider: auth_hash['provider'],
      uid:      auth_hash['uid'],
      name:     auth_hash['info']['name'],
      # first and last name available separately from facebook
      email:    auth_hash['info']['email']
    }
    return User.create(params)
  end

end
