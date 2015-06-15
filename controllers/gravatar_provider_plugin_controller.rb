class GravatarProviderPluginController <  PublicController
  append_view_path File.join(File.dirname(__FILE__) + '/../views')
  def h
    begin
      user_hash = GravatarProviderPlugin::UserEmailHash.where(email_md5_hash: params[:id]).first
      redirect_to profile_icon(user_hash.user.person, :thumb)
    rescue Exception => e
      Rails.logger.error "GravatarProviderPlugin:: Cannot find profile image for hash [#{params[:id]}]"
      redirect_to '/plugins/gravatar_provider/images/nophoto.png'
    end
  end

end
