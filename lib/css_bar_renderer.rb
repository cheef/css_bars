class CssBarRenderer
  def initialize(template, data, mode)
    @template = template
    @graphs_data = data
    @mode = mode
  end
  
  def render
    content_tag(:table, :class => "graph_table") do
      graphs
    end
  end
  
  def graphs
    @graphs_data.map{|graph| CssGraphRenderer.new(@template, graph, @mode).render}.join unless @graphs_data.blank?    
  end
  
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end