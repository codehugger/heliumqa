require "administrate/base_dashboard"

class AnalysisRequestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    analysis: Field::BelongsTo,
    scan_protocol: Field::BelongsTo,
    analysis_response: Field::HasOne,
    analysis_request_files: Field::HasMany,
    id: Field::Number,
    key: Field::String,
    request_data: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :analysis,
    :scan_protocol,
    :analysis_response,
    :analysis_request_files,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :analysis,
    :scan_protocol,
    :analysis_response,
    :analysis_request_files,
    :id,
    :key,
    :request_data,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :analysis,
    :scan_protocol,
    :analysis_response,
    :analysis_request_files,
    :key,
    :request_data,
  ].freeze

  # Overwrite this method to customize how analysis requests are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(analysis_request)
  #   "AnalysisRequest ##{analysis_request.id}"
  # end
end
