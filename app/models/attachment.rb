class Attachment < ActiveRecord::Base

belongs_to :post


def uri?(@attachment.URL)
  uri = URI.parse(@attachment.URL)
  %w( http https ).include?(uri.scheme)
rescue URI::BadURIError
  false
end


end
