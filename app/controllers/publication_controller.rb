class PublicationController < InnerPageController
  def list

    respond_to do |format|

      @articles = Article.order_by_date_desc.publications_exclude_ads.page(params[:page]).per(20)

      format.html do
        #@publications = Publication.where(published: 't').limit(10)
        #@articles = Article.publications.includes(:attachments)
        @publication_ads = ArticleAd.ads
        #@publication_ads =


        @breadcrumbs.push({title: "Публікації", url: false, current: true})

        #render inline: I18n.locale.to_s

        #render template: "publication/_list_item", locals: { article: @articles[0] }
        #render inline: @articles[0].url

      end

      format.json do
        articles_html = ""
        @articles.each do |a|
          articles_html += render_to_string template: 'publication/_list_item.html', layout: false, locals: { article: a }
        end
        data = { html: articles_html }
        render json: data
      end
    end

    # if params[:format] == "json"
    #   articles_html = render_to_string template: 'publication/_list_item', layout: false, collection: @articles
    #   data = { html: articles_html }
    #   #render inline: data.to_json
    #   render json: data
    # end
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
