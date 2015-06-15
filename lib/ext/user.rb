require_dependency 'user'
require 'digest/md5'

User.class_eval do

  after_create :insert_email_hash

  def insert_email_hash
    GravatarProviderPlugin::UserEmailHash.create! do |user_email_hash|
      user_email_hash.user = self
      user_email_hash.email_md5_hash = Digest::MD5.hexdigest(self.email)
    end
  end
  
end
