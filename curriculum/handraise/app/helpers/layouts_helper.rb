module LayoutsHelper

  def nav_settings_icon_white
    src = 'settings-gear-white.png'
    image_tag src, :size => "30x30", :class => "nav-settings-icon"
  end

  def nav_settings_icon_black
  src = 'settings-gear-black.png'
  image_tag src, :size => "40x40", :class => "nav-settings-icon"
  end

end
