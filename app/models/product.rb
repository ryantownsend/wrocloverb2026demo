class Product < ApplicationRecord
  validates :title, :description, presence: true
  validates :stock_level, :price_cents, numericality: { greater_than_or_equal_to: 0, allow_blank: false }

  def published=(value)
    if ActiveRecord::Type::Boolean.new.cast(value)
      self.published_at ||= Time.current
    else
      self.published_at = nil
    end
  end

  def published
    published_at.present?
  end
  alias_method :published?, :published

  def price=(value)
    self.price_cents = Integer(BigDecimal(value) * 100)
  end

  def price
    format("%.2f", BigDecimal(price_cents) / 100)
  end
end
