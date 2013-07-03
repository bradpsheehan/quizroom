module ApplicationHelper

  def current_classroom
    1
  end

  def broadcast(channel, &block)

    message = {:channel => channel, :data => capture(&block)}
    uri = URI.parse("http://www.dannygarcia.me:9292/faye.js")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
