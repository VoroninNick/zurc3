class PublicationController < InnerPageController
  def list
    @publications = Publication.where(published: 't').limit(10)
  end

  def view
  end
end
