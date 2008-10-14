module Che
  module CssBars
    
    @@css_bars_options = {
      :default_color_scheme => [],
      :default_mode => :color_scheme
    }
    
    mattr_reader :css_bars_options
    
    def css_bars_include_tag(content_to = "")
      return nil if @css_bars_included
      @css_bars_included = true
      content_to.blank? ? 
        stylesheet_link_tag('css_bars/css_bars', :media => 'all') :      
          content_for(content_to){stylesheet_link_tag 'css_bars/css_bars', :media => 'all'}
    end

    def horizontal_bar(data, css_to = "", mode = css_bars_options[:default_mode])
      css_bars_include_tag css_to unless css_to.blank?
      CssBarRenderer.new(@template, data, mode).render
    end
  end
end