module ApplicationHelper

  def presenter(model)
    klass = "#{model.class}Presenter".constantize
    instance = klass.new(model)
    yield(instance) if block_given?
  end
end
