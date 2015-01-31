class PublicationController < InnerPageController
  def list
    #@publications = Publication.where(published: 't').limit(10)
    #@articles = Article.publications.includes(:attachments)
    @publication_ads = PublicationAd.ads
    @articles = Article.order_by_date_desc.publications_exclude_ads(@publication_ads)

    @breadcrumbs.push({title: "Публікації", url: false, current: true})

    #render inline: I18n.locale.to_s

    #render template: "publication/_list_item", locals: { article: @articles[0] }
    #render inline: @articles[0].url
  end

  def view
    @params_id = params[:id]
    @article = Article.publications.by_url(@params_id).first
    #render inline: @article.inspect

    if @article
      @breadcrumbs.push({title: "Публікації", url: send("#{I18n.locale}_publication_list_path"), current: false})
      @breadcrumbs.push({title: @article.name, url: false, current: true})

      @related_articles = @article.related_publications
    end
  end
end
