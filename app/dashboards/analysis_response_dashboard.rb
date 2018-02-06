require "administrate/base_dashboard"

class AnalysisResponseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    analysis_request: Field::BelongsTo,
    analysis_response_files: Field::HasMany,
    id: Field::Number,
    key: Field::String,
    response_data: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :analysis_request,
    :analysis_response_files,
    :id,
    :key,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :analysis_request,
    :analysis_response_files,
    :id,
    :key,
    :response_data,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :analysis_request,
    :analysis_response_files,
    :key,
    :response_data,
  ].freeze

  # Overwrite this method to customize how analysis responses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(analysis_response)
  #   "AnalysisResponse ##{analysis_response.id}"
  # end
end
