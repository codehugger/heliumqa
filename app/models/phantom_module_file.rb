class PhantomModuleFile < ApplicationRecord
  include PhantomModuleFileUploader::Attachment.new(:file)

  belongs_to :scan_protocol
end
