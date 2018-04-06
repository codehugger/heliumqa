class InspectionFileDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def status
    badge_class = "badge-warning"
    badge_text = "cached"
    if object.file_attacher.stored?
      if object.preview_generated.blank?
        if object.protocol_matched.blank?
          badge_class = "badge-info"
          badge_text = "Matching protocol"
        else
          badge_class = "badge-info"
          badge_text = "Generating preview"
        end
      else
        badge_class = "badge-success"
        badge_text = "Done"
      end
    else
      badge_text = "Stored"
    end

    helpers.content_tag :span, class: "badge #{badge_class}" do
      badge_text
    end
  end
end
