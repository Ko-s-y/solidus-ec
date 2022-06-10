Spree::Product.class_eval do
  def related_products
    Spree::Product.
      all.
      includes(master: [:images, :default_price]).
      in_taxons(taxons).
      where.not(id: id).
      distinct
  end
end
