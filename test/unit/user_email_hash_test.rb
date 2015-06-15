require "test_helper"

class UserEmailHashTest < ActiveSupport::TestCase
  fixtures :profiles, :environments, :users, :roles, :domains

  def setup
    @user_email_hash = GravatarProviderPlugin::UserEmailHash.new
  end

  should 'not save without user' do
    assert !@user_email_hash.save
  end

  should 'require user' do
    @user_email_hash.save
    assert @user_email_hash.errors[:user].present?
  end

  should 'require email_md5_hash' do
    @user_email_hash.save
    assert @user_email_hash.errors[:email_md5_hash].present?
  end

  should 'have user_email_hash record crerated after user creation' do
    user = create_user_full 'mytestuser'
    assert GravatarProviderPlugin::UserEmailHash.where(user_id: user.id).count.eql?(1)
  end
end
