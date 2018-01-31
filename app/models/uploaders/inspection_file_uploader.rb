class InspectionFileUploader < Shrine
  include DICOM
  include ImageProcessing::MiniMagick

  # Maintain consistent preview dimensions
  PREVIEW_HEIGHT = 500
  PREVIEW_WIDTH  = 500
  THUMBMNAIL_WIDTH = 100
  THUMBNAIL_HEIGHT = 100

  # The versions plugin enables your uploader to deal with versions, by
  # allowing you to return a Hash of files when processing.
  plugin :versions

  # Only accept DICOM files
  Attacher.validate { validate_mime_type_inclusion %w(application/dicom) }

  process(:store) do |io, context|
    # Process differently based on the actual mime-type
    preview = nil
    thumbnail = nil
    case Shrine.determine_mime_type(io)
    when 'application/dicom'
      # Download a temporary file for processing
      tempfile = io.download

      # Allocate tempfile pointer for preview file
      preview = Tempfile.new(["preview", ".png"], binmode: true)

      # Use MiniMagick to extract normalized PNG preview
      DICOM.image_processor = :mini_magick
      dcm = DObject.read(tempfile.path)

      dcm.image.normalize.write(preview.path)
      preview = resize_to_limit(
        preview, PREVIEW_WIDTH, PREVIEW_HEIGHT) { |cmd| cmd.auto_orient }
      thumbnail = resize_to_limit(
        preview, THUMBMNAIL_WIDTH, THUMBNAIL_HEIGHT) { |cmd| cmd.auto_orient }

      # Make sure we don't leave any garbage after we finish
      tempfile.delete
    end

    {original: io, preview: preview, thumbnail: thumbnail}
  end
end
