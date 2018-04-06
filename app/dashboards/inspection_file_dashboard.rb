require "administrate/base_dashboard"

class InspectionFileDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    inspection: Field::BelongsTo,
    scan_protocol: Field::BelongsTo,
    id: Field::Number,
    file_data: Field::String.with_options(searchable: false),
    scan_header: Field::String.with_options(searchable: false),
    scanned_at: Field::DateTime,
    matched_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :inspection,
    :scan_protocol,
    :id,
    :file_data,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :inspection,
    :scan_protocol,
    :id,
    :file_data,
    :scan_header,
    :scanned_at,
    :matched_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :inspection,
    :scan_protocol,
    :file_data,
    :scan_header,
    :scanned_at,
    :matched_at,
  ].freeze

  # Overwrite this method to customize how inspection files are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(inspection_file)
  #   "InspectionFile ##{inspection_file.id}"
  # end
end
