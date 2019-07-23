class ShareObserver < ActiveRecord::Observer
  def before_save(resource)
    share = Yt::Video.new url: resource.url
    resource.uid = share.id
    resource.title = share.title
    resource.description = share.description
    resource.likes = share.like_count
    resource.dislikes = share.dislike_count
    resource.published_at = share.published_at
  rescue Yt::Errors::NoItems
    resource.title = ''
  end
end
