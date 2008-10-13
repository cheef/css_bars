class CssBarRenderer
  def initialize(template, data)
    @template = template
    @graphs_data = data
  end
  
  def render(data = [])
    content_tag(:table, :class => "graph_table") do
      graphs
    end
  end
  
  def graphs
    @graphs_data.map{|graph| CssGraphRenderer.new(@template, graph).render}.join unless @graphs_data.blank?    
  end
  
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end