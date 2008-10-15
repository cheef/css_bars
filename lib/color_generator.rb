class ColorGenerator 

  def initialize(start_color, end_color, points = 10)
    @start = Color.new(start_color)
    @end = Color.new(end_color)
    @points = points
  end
  
  class Color
    attr_accessor :r, :g, :b

    def initialize(color)
      @r = color[0..1].to_i(16)
      @g = color[2..3].to_i(16)
      @b = color[4..5].to_i(16)
    end

    def to_html      
      channels.map{|channel| channel = channel - 256 if channel > 256; channel.round.to_s(16)}.join.upcase
    end
    
    def with_shift(*shift)
      @r, @g, @b = @r - shift[0], @g - shift[1], @b - shift[2]
      return self
    end
    
    private
    
      def channels
        [@r, @g, @b]
      end
  end
  
  def render_by_point(point)
    render_by_percent percents_at_point(point)
  end
  
  def render_by_percent(percent)
    rk, gk, bk = (@start.r - @end.r).to_f/100, (@start.g - @end.g).to_f/100, (@start.b - @end.b).to_f/100
    Color.new(@start.to_html).with_shift(rk*percent, gk*percent, bk*percent).to_html
  end
  
  private
  
    def percents_at_point(point)
      (point/@points.to_f)*100
    end
end