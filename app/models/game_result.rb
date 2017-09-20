class GameResult
  attr_reader :id,
              :box_image_large,
              :box_image_med.
              :box_image_small,
              :logo_large,
              :logo_med,
              :logo_small,
              :popularity

  def initialize(attrs)
    @id              = attrs[:name]
    @box_image_large = attrs[:box][:large]
    @box_image_med   = attrs[:box][:medium]
    @box_image_small = attrs[:box][:small]
    @logo_large      = attrs[:logo][:large]
    @logo_med        = attrs[:logo][:medium]
    @logo_small      = attrs[:logo][:small]
    @popularity      = attrs[:popularity]
  end
end
