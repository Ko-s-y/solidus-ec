module Potepan::ProductDecorator
  def related_products
    Spree::Product.
      all.
      in_taxons(taxons).
      where.not(id: id).
      distinct
  end
  Spree::Product.prepend self
end
