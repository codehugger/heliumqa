class InspectionFilePreviewUploader < Shrine
  include ImageProcessing::MiniMagick

  # The versions plugin enables your uploader to deal with versions, by
  # allowing you to return a Hash of files when processing.
  plugin :versions

  process(:store) do |io, context|
    original = io.download

    pipeline = ImageProcessing::MiniMagick
      .source(original)
      .convert("png")

    large  = pipeline.resize_to_limit!(512, 512) { |cmd| cmd.auto_orient }
    medium = pipeline.resize_to_limit!(256, 256)
    small  = pipeline.resize_to_limit!(128, 128)
    tiny   = pipeline.resize_to_limit!( 64,  64)

    {large: large, medium: medium, small: small, tiny: tiny}
  end
end
