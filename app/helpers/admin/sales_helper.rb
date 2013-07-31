module Admin::SalesHelper
  def activate_or_end_translation(status)
    { 'active' => t('sale.end'),
      'ended' => t('sale.activate')
    }[status]
  end
end
