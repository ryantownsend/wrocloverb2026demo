class NewsletterSignupsController < ApplicationController
  include FragmentRendering

  def new
    @newsletter_signup = NewsletterSignup.new
  end

  def create
    @newsletter_signup = NewsletterSignup.new(newsletter_signup_params)

    if request.variant.fragment?
      # for explicit renders where the action is defined, we have to manually set the content type
      response.headers["Content-Type"] = "text/html+fragment"
    end

    if @newsletter_signup.valid?
      render :create, status: :created
    elsif request.variant.fragment?
      render :errors, status: :unprocessable_entity
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def newsletter_signup_params
    params.require(:newsletter_signup).permit(:email)
  end
end
