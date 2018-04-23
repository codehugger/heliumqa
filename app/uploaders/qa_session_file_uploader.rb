class QaSessionFileUploader < Shrine
  include DICOM

  # Only accept DICOM
  Attacher.validate { validate_mime_type_inclusion MimeType.all.collect(&:name) }
end
