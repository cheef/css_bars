module Che
  module CssBars
<<<<<<< HEAD:lib/che_css_bars.rb
=======
    
    @@css_bars_options = {
      :default_color_scheme => [],
      :default_mode => :color_scheme
    }
    
    mattr_reader :css_bars_options
    
>>>>>>> dev:lib/che_css_bars.rb
    def css_bars_include_tag(content_to = "")
      return nil if @css_bars_included
      @css_bars_included = true
      content_to.blank? ? 
        stylesheet_link_tag('css_bars/css_bars', :media => 'all') :      
          content_for(content_to){stylesheet_link_tag 'css_bars/css_bars', :media => 'all'}
    end

<<<<<<< HEAD:lib/che_css_bars.rb
    def horizontal_bar(data, css_to = "")
      css_bars_include_tag css_to unless css_to.blank?
      CssBarRenderer.new(@template, data).render
=======
    def horizontal_bar(data, css_to = "", mode = css_bars_options[:default_mode])
      css_bars_include_tag css_to unless css_to.blank?
      CssBarRenderer.new(@template, data, mode).render
>>>>>>> dev:lib/che_css_bars.rb
    end
  end
end