module ApplicationHelper
  def link_to_prev(scope, options = {}, block)
    params = options.delete(:params) || {}
    param_name = options.delete(:param_name) || Kaminari.config.param_name
    unless scope.first_page?
      link_to params.merge(param_name => (scope.current_page - 1)), options.reverse_merge(:rel => 'previous') do
        block
      end
    else
      block
    end
  end
  def link_to_next(scope, options = {}, block)
    params = options.delete(:params) || {}
    param_name = options.delete(:param_name) || Kaminari.config.param_name
    unless scope.last_page?
      link_to params.merge(param_name => (scope.current_page + 1)), options.reverse_merge(:rel => 'next') do
        block
      end
    else
      block
    end
  end

  def render_partners_for(object)
    render 'shared/partners', object: object if object.has_partners_codes?
  end

end
