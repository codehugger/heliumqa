require "administrate/base_dashboard"

class InspectionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    equipment: Field::BelongsTo,
    inspection_files: Field::HasMany,
    scan_protocols: Field::HasMany,
    analyses: Field::HasMany,
    analysis_requests: Field::HasMany,
    id: Field::Number,
    key: Field::String,
    performed_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :equipment,
    :inspection_files,
    :scan_protocols,
    :analyses,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :equipment,
    :inspection_files,
    :scan_protocols,
    :analyses,
    :analysis_requests,
    :id,
    :key,
    :performed_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :equipment,
    :inspection_files,
    :scan_protocols,
    :analyses,
    :analysis_requests,
    :key,
    :performed_at,
  ].freeze

  # Overwrite this method to customize how inspections are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(inspection)
  #   "Inspection ##{inspection.id}"
  # end
end
