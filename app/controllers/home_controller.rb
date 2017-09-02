class HomeController < ApplicationController
  def index
    HardWorker.perform_async
  end

  def new
  end

end
