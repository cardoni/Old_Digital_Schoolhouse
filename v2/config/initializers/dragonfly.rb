require 'dragonfly'

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)
app.define_macro(ActiveRecord::Base, :image_df_accessor)
app.configure do |c|
  c.datastore = Dragonfly::DataStorage::S3DataStore.new({
    :bucket_name          => ENV['S3_BUCKET'],
    :access_key_id        => ENV['S3_KEY'], #AppConfig[:s3_key],
    :secret_access_key    => ENV['S3_SECRET'], #AppConfig[:s3_secret], 
    # :path                 => 'images '
  })

  c.server.before_serve do |job, env|
    uid = job.store
    Thumb.create!( :uid => uid, :job => job.serialize )
  end

  c.define_url do |app, job, opts|
    thumb = Thumb.find_by_job(job.serialize)
    if thumb
      app.datastore.url_for(thumb.uid)
    else
      app.server.url_for(job)
    end
  end
end
# app.configure do |c|
# 
#   # Override the .url method...
#   c.define_url do |app, job, opts|
#     thumb = Thumb.find_by_job(job.serialize)
#     # If (fetch 'some_uid' then resize to '40x40') has been stored already, give the datastore's remote url ...
#     if thumb
#       app.datastore.url_for(thumb.uid)
#     # ...otherwise give the local Dragonfly server url
#     else
#       app.server.url_for(job)
#     end
#   end
# 
#   # Before serving from the local Dragonfly server...
#   c.server.before_serve do |job, env|
#     # ...store the thumbnail in the datastore...
#     uid = job.store
# 
#     # ...keep track of its uid so next time we can serve directly from the datastore
#     Thumb.create!(
#       :uid => uid,
#       :job => job.serialize     # 'BAhbBls...' - holds all the job info
#     )                           # e.g. fetch 'some_uid' then resize to '40x40'
#   end
# 
# end


