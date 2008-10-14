class CssGraphRenderer
  def initialize(template, data)
    @template = template
    @value = data[1]
    @label = data[0]
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
    "##{ColorGenerator.new("F68654", "94D234", 10).render_by_percent(value)}"
  end
  
#  def with_color(value)    
#    if (value >= 0) and (value <= 10)
#      "#F68654"
#    elsif (value > 10) and (value <= 20)
#      "#F79052"
#    elsif (value > 20) and (value <= 30)
#      "#F8984E"
#    elsif (value > 30) and (value <= 40)
#      "#FAA749"
#    elsif (value > 40) and (value <= 50)
#      "#FBB847"   
#    elsif (value > 50) and (value <= 60)
#      "#FDCB3D"   
#    elsif (value > 60) and (value <= 70)
#      "#FEE329"   
#    elsif (value > 70) and (value <= 80)
#      "#F1F60F"   
#    elsif (value > 80) and (value <= 90)
#      "#C2E42A"
#    else
#      "#94D234"
#    end
#  end
  
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end