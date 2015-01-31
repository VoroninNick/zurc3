class ContactController < InnerPageController
  def index
    @breadcrumbs.push({title: "Контакти", url: false, current: true})

    @map_markers = [{lat: 49.843031, lng: 24.041205 }]

    @message = Message.new
  end

  def post_message
    render inline: 'hello'
  end
end
