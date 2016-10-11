class NotificationsController < WebsocketRails::BaseController

  def hello
    Viewer.increment_counter(:count, 1)
    @count = Viewer.first.count
    WebsocketRails[:updates].trigger(:update, @count)
  end

  def goodbye
    Viewer.decrement_counter(:count, 1)
    @count = Viewer.first.count
    WebsocketRails[:updates].triger(:update, @count)
  end

end
