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
    equipment_profile: Field::BelongsTo,
    id: Field::Number,
    file_data: Field::String.with_options(searchable: false),
    profile_header: Field::String.with_options(searchable: false),
    profiled_at: Field::DateTime,
    probed_at: Field::DateTime,
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
    :equipment_profile,
    :id,
    :file_data,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :inspection,
    :equipment_profile,
    :id,
    :file_data,
    :profile_header,
    :profiled_at,
    :probed_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :inspection,
    :equipment_profile,
    :file_data,
    :profile_header,
    :profiled_at,
    :probed_at,
  ].freeze

  # Overwrite this method to customize how inspection files are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(inspection_file)
  #   "InspectionFile ##{inspection_file.id}"
  # end
end
