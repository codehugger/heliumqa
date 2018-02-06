require "administrate/base_dashboard"

class AnalysisDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    inspection: Field::BelongsTo,
    analysis_requests: Field::HasMany,
    analysis_responses: Field::HasMany,
    id: Field::Number,
    key: Field::String,
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
    :analysis_requests,
    :analysis_responses,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :inspection,
    :analysis_requests,
    :analysis_responses,
    :id,
    :key,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :inspection,
    :analysis_requests,
    :analysis_responses,
    :key,
  ].freeze

  # Overwrite this method to customize how analyses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(analysis)
  #   "Analysis ##{analysis.id}"
  # end
end
