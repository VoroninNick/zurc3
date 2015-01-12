class ContactController < InnerPageController
  def index
    @breadcrumbs.push({title: "Контакти", url: false, current: true})
  end
end
