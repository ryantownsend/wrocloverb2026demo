module FragmentRendering
  extend ActiveSupport::Concern

  included do
    before_action :set_variant, unless: :disable_fragments?
    after_action :set_fragment_content_type_for_implicit_render
  end

  private

  def set_variant
    if request.headers["accept"]&.include?("text/html+fragment")
      request.variant = :fragment
    end
  end

  # sets the Content-Type header for implicit responses where no action is defined but the html+fragment view exists
  def set_fragment_content_type_for_implicit_render
    fragment_template_exists = lookup_context.exists?(action_name, _prefixes, false, [], formats: [ :html ], variants: [ :fragment ])

    if request.variant.fragment? && fragment_template_exists
      response.headers["Content-Type"] = "text/html+fragment"
    end
  end

  # for demonstration purposes, allow fragments to be disabled via query param to show the difference in behavior
  def disable_fragments?
    "true" == params[:disable_fragments]
  end
end
