class ShareObserver < ActiveRecord::Observer
  def before_save(resource)
    share = Yt::Share.new url: resource.url
    resource.uid = video.id
    resource.title = video.title
    resource.likes = video.like_count
    resource.dislikes = video.dislike_count
    resource.published_at = video.published_at
  rescue Yt::Errors::NoItems
    resource.title = ''
  end
end
