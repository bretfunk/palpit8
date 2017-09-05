class StreamController < ApplicationController

  def show
    @stream = Stream.new
  end

end
