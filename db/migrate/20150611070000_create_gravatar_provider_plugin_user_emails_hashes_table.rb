class CreateGravatarProviderPluginUserEmailsHashesTable < ActiveRecord::Migration
  def self.up
    create_table :gravatar_provider_plugin_user_email_hashes do |t|
      t.belongs_to :user
      t.string :email_md5_hash
    end
    add_index(
        :gravatar_provider_plugin_user_email_hashes,
        [:email_md5_hash],
        name: 'index_gravatar_provider_plugin_md5_hash'
    )
    user_count = User.count
    puts "Migrating #{user_count} user to table gravatar_provider_plugin_user_email_hashes..."
    User.all.each do |user|
      GravatarProviderPlugin::UserEmailHash.create! do |user_email_hash|
        user_email_hash.user = user
        user_email_hash.email_md5_hash = Digest::MD5.hexdigest(user.email)
      end
    end
    puts "Migration gravatar_provider_plugin_user_email_hashes completed"
  end
  def self.down
    drop_table :gravatar_provider_plugin_user_email_hashes
  end
end
