require 'dragonfly'

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)
app.define_macro(ActiveRecord::Base, :image_accessor)
app.datastore = Dragonfly::DataStorage::S3DataStore.new({
  :bucket_name          => 'media.adam.1',
  :access_key_id        => 'AKIAJ6LQSKCQCLRRGSVQ',
  :secret_access_key    => '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',
  # :path                 => 'images '
})
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


