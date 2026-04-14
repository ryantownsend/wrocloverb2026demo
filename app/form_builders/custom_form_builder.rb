class CustomFormBuilder < ActionView::Helpers::FormBuilder
  # renders template tags with form error messages for each field
  def form_errors_in_templates
    @template.capture do
      object.errors.attribute_names.map do |key|
        @template.concat @template.content_tag(:template, form_errors_with_placeholder(key), for: "errors_for_#{field_id(key)}")
      end
    end
  end

  # renders the errors for a single field including a wrapping placeholder for client-side replacement
  def form_errors_with_placeholder(method)
    @template.capture do
      @template.concat "<?start name=\"errors_for_#{field_id(method)}\"?>".html_safe
      @template.concat form_errors_for(method)
      @template.concat "<?end name=\"errors_for_#{field_id(method)}\"?>".html_safe
    end
  end

  # renders the errors for a single field, if any exist
  def form_errors_for(method)
    if object.errors.full_messages_for(method).any?
      @template.content_tag(:div, class: "text-red-500 text-sm mt-1") do
        object.errors.full_messages_for(method).to_sentence
      end
    end
  end

  # Add custom form helper methods here
  def custom_text_field(method, options = {})
    text_field(method, options)
  end

  def custom_submit(value = nil, options = {})
    submit(value, options)
  end
end
