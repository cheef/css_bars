module Che
  module CssBars
    def css_bars_include_tag(content_to = "")
      return nil if @css_bars_included
      @css_bars_included = true
      content_to.blank? ? 
        stylesheet_link_tag('css_bars/css_bars', :media => 'all') :      
          content_for(content_to){stylesheet_link_tag 'css_bars/css_bars', :media => 'all'}
    end

    def horizontal_bar(data, css_to = "")
      css_bars_include_tag css_to unless css_to.blank?
      CssBarRenderer.new(@template, data).render
    end
  end
end