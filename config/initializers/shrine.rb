require 'shrine/storage/s3'

# We ONLY support S3 in this application. Developers should create their own
# separate bucket for local development.
#
# Please refer to config/initializers/figaro.rb on required environment
# variables for use with Shrine.

s3_options = {
  access_key_id:      Figaro.env.aws_access_key_id,
  secret_access_key:  Figaro.env.aws_secret_access_key,
  region:             Figaro.env.aws_region,
  bucket:             Figaro.env.aws_bucket,
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}

# The activerecord plugin extends the “attachment” interface with support for
# ActiveRecord.
# http://shrinerb.com/rdoc/classes/Shrine/Plugins/Activerecord.html
Shrine.plugin :activerecord

# The upload_endpoint plugin provides a Rack endpoint which accepts file
# uploads and forwards them to specified storage.
# http://shrinerb.com/rdoc/classes/Shrine/Plugins/UploadEndpoint.html
Shrine.plugin :upload_endpoint

# The presign_endpoint plugin provides a Rack endpoint which generates the URL,
# fields, and headers that can be used to upload files directly to a storage
# service.
# http://shrinerb.com/rdoc/classes/Shrine/Plugins/PresignEndpoint.html
Shrine.plugin :presign_endpoint,
              presign_options: ->(request) do
                filename = request.params["filename"]
                {content_disposition: "attachment; filename=#{filename.inspect}"}
              end,
              presign_location: -> (request) do
                "#{SecureRandom.hex}/#{request.params["filename"]}"
              end

# The restore_cached_data plugin re-extracts metadata when assigning already
# cached files, i.e. when the attachment has been retained on validation errors
# or assigned from a direct upload.
# http://shrinerb.com/rdoc/classes/Shrine/Plugins/RestoreCachedData.html
Shrine.plugin :restore_cached_data

# The determine_mime_type plugin allows you to determine and store the actual
# MIME type of the file analyzed from file content.
# http://shrinerb.com/rdoc/classes/Shrine/Plugins/DetermineMimeType.html
Shrine.plugin :determine_mime_type

# The validation_helpers plugin provides helper methods for validating attached
# files.
# http://shrinerb.com/rdoc/classes/Shrine/Plugins/ValidationHelpers.html
Shrine.plugin :validation_helpers

# The add_metadata plugin provides a convenient method for extracting and
# adding custom metadata values.
# http://shrinerb.com/rdoc/classes/Shrine/Plugins/AddMetadata.html
Shrine.plugin :add_metadata

# Shrine uploaders can define the #process method, which will get called
# whenever a file is uploaded. It is given the original file, and is expected
# to return the processed files.
# http://shrinerb.com/rdoc/classes/Shrine/Plugins/Processing.html
Shrine.plugin :processing

# The recache plugin allows you to process your attachment after validations
# succeed, but before the attachment is promoted. This is useful for example
# when you want to generate some versions upfront (so the user immediately sees
# them) and other versions you want to generate in the promotion phase in a
# background job.
Shrine.plugin :versions

# The backgrounding plugin enables you to move promoting and deleting of files
# from record's lifecycle into background jobs. This is especially useful if
# you're doing processing and/or you're storing files on an external storage
# service.
Shrine.plugin :backgrounding
# Global job promotion, can be overriden in individual uploaders
Shrine::Attacher.promote { |data| PromoteJob.perform_later(data) }
Shrine::Attacher.delete { |data| DeleteJob.perform_later(data) }

# The pretty_location plugin attempts to generate a nicer folder structure
# for uploaded files.
Shrine.plugin :pretty_location

# The data_uri plugin enables you to upload files as data URIs with JSON
Shrine.plugin :data_uri

# The multi_delete plugins allows you to leverage your storage's multi delete
# capabilities.
Shrine.plugin :multi_delete

# The delete_promoted plugin deletes files that have been promoted, after the
# record is saved. This means that cached files handled by the attacher will
# automatically get deleted once they're uploaded to store. This also applies
# to any other uploaded file passed to Attacher#promote.
Shrine.plugin :delete_promoted

# The parsed_json plugin is suitable for the case when your framework is
# automatically parsing JSON query parameters, allowing you to assign cached
# files with hashes/arrays.
Shrine.plugin :parsed_json
