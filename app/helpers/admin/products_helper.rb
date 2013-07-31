module Admin::ProductsHelper
  def activate_or_retire_translation(status)
    { 'active' => t('product.retire'),
      'retired' => t('product.activate')
    }[status]
  end
end
