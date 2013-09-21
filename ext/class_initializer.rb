module ClassInitializer
  def initialize(attributes, skip_these=[])
    for attr in attributes
      next if skip_these.include?(attr[0])
      next unless respond_to?(attr[0])
      instance_variable_set "@#{attr[0]}", attr[1]
    end
  end
end
