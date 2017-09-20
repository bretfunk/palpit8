class ChannelResult
  attr_reader :id,
              :language,
              :display_name,
              :followers,
              :game,
              :logo,
              :profile_banner,
              :status,
              :url,
              :video_banner,
              :views

  def initialize(attrs)
    @id             = attrs(:name)
    @language       = attrs(:language)
    @display_name   = attrs(:display_name)
    @followers      = attrs(:followers)
    @game           = attrs(:game)
    @logo           = attrs(:logo)
    @profile_banner = attrs(:profile_banner)
    @status         = attrs(:status)
    @url            = attrs(:url)
    @video_banner   = attrs(:video_banner)
    @views          = attrs(:views)
  end
end
