class GravatarProviderPlugin < Noosfero::Plugin

  def self.plugin_name
    "GravatarProviderPlugin"
  end

  def self.plugin_description
    _("A plugin that enable noosfero as a gravatar server")
  end

  def stylesheet?
    true
  end

end
