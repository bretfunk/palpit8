class HomeController < ApplicationController
  def index
    HardWorker.perform_async
  end
end
