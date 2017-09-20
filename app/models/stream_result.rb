class StreamResult
  attr_reader :id,
              :name,
              :followers,
              :game,
              :logo,
              :profile_banner,
              :status,
              :url,
              :video_banner,
              :views,
              :viewers,
              :preview_large,
              :preview_medium,
              :preview_small,
              :preview_temp

  def initialize(attrs)
    @id = attrs[:channel][:name]
    @name = attrs[:channel][:display_name]
    @followers = attrs[:channel][:followers]
    @game = attrs[:channel][:game]
    @logo = attrs[:channel][:logo]
    @profile_banner = attrs[:channel][:profile_banner]
    @status = attrs[:channel][:status]
    @url = attrs[:channel][:url]
    @video_banner = attrs[:channel][:video_banner]
    @views = attrs[:channel][:views]
    @viewers = attrs[:viewers]
    @preview_large = attrs[:preview][:large]
    @preview_medium = attrs[:preview][:medium]
    @preview_small = attrs[:preview][:small]
    @preview_temp = attrs[:preview][:template]
  end
end
