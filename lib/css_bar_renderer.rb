class CssBarRenderer
<<<<<<< HEAD:lib/css_bar_renderer.rb
  def initialize(template, data)
    @template = template
    @graphs_data = data
  end
  
  def render(data = [])
=======
  def initialize(template, data, mode)
    @template = template
    @graphs_data = data
    @mode = mode
  end
  
  def render
>>>>>>> dev:lib/css_bar_renderer.rb
    content_tag(:table, :class => "graph_table") do
      graphs
    end
  end
  
  def graphs
<<<<<<< HEAD:lib/css_bar_renderer.rb
    @graphs_data.map{|graph| CssGraphRenderer.new(@template, graph).render}.join unless @graphs_data.blank?    
=======
    @graphs_data.map{|graph| CssGraphRenderer.new(@template, graph, @mode).render}.join unless @graphs_data.blank?    
>>>>>>> dev:lib/css_bar_renderer.rb
  end
  
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end