class GravatarProviderPlugin::UserEmailHash < Noosfero::Plugin::ActiveRecord
  belongs_to :user

  attr_accessible :email_md5_hash

  validates_presence_of :user, :email_md5_hash

end
