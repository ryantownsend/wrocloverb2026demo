class ProductsController < ApplicationController
  include FragmentRendering

  SORT_OPTIONS = {
    title_asc: { title: :asc, created_at: :asc },
    title_desc: { title: :desc, created_at: :asc },
    price_asc: { price_cents: :asc, created_at: :asc },
    price_desc: { price_cents: :desc, created_at: :asc },
    stock_asc: { stock_level: :asc, created_at: :asc },
    stock_desc: { stock_level: :desc, created_at: :asc },
    published_at_asc: { published_at: :asc, created_at: :asc },
    published_at_desc: { published_at: :desc, created_at: :asc }
  }.with_indifferent_access.freeze

  DEFAULT_SORT_BY = "title_asc"

  def index
    params[:sort_by] ||= DEFAULT_SORT_BY
    @products = Product.order(SORT_OPTIONS.fetch(params[:sort_by]) { SORT_OPTIONS.fetch(DEFAULT_SORT_BY) }).limit(5)
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      if request.variant.fragment?
        render :update, status: :ok
      else
        redirect_back_or_to action: :index
      end
    else
      if request.variant.fragment?
        render :errors, status: :unprocessable_entity
      else
        redirect_back_or_to action: :index
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :stock_level, :published)
  end
end
