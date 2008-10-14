class CssGraphRenderer
  
  class ColorScheme
    def initialize(scheme)      
      @scheme = scheme
      @points = scheme.size
    end
    
    def render_by_percent(value)
      render_by_point((value/percent).ceil)
    end
    
    def render_by_point(point)
      @scheme[point-1]
    end
    
    def percent
      100/@points.to_f
    end
  end
  
  def initialize(template, data, mode)
    @template = template
    @value = data[1]
    @label = data[0]
    @mode = mode
  end
  
  def render
    content_tag :tr do
      html = content_tag :td, :class => "graph_bar" do
        content_tag :div, :class => "graph" do
          content_tag :strong,
            :class => "bar",
            :style => "width: #{@value}%; background: #{with_color(@value)} none repeat scroll;",
            :title => "#{@label.to_s.humanize}" do
              content_tag :span, "#{@value}%"
          end
        end
      end
      html += content_tag :td, @label, :class => "graph_text"
    end
  end
  
  def with_color(value)
    (@mode == :color_scheme) ? by_scheme(value) : (by_generator(value) if @mode == :color_generator)
  end
  
  def by_generator(value)
    "##{ColorGenerator.new("F68654", "94D234", 10).render_by_percent(value)}"
  end
  
  def by_scheme(value)
    "##{ColorScheme.new(Che::CssBars.css_bars_options[:default_color_scheme]).render_by_percent(value)}"
  end
  
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end