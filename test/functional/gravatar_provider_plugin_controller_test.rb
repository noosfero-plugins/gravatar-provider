require "test_helper"

class GravatarProviderPluginControllerTest < ActionController::TestCase
  fixtures :profiles, :environments, :users, :roles, :domains

  include ApplicationHelper

  def setup
    user = create_user_full('testinguser')
    @person = user.person
    @user_email_hash = GravatarProviderPlugin::UserEmailHash.where(user_id: user.id).first
  end

  def current_theme
    'default'
  end

  def test_index_should_redirect_to_user_image
    get :h, {id: @user_email_hash.email_md5_hash}
    assert_redirected_to profile_icon(@person, :thumb)
  end


end
