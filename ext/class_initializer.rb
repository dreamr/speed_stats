module ClassInitializer
  attr_reader :attributes

  def initialize(attributes, skip_these=[])
    @attributes = []
    for attr in attributes
      next if skip_these.include?(attr[0])
      next unless respond_to?(attr[0])
      @attributes = @attributes + [attr]
      instance_variable_set "@#{attr[0]}", attr[1]
    end
  end

  def ==(b)
    attributes.map{|k,v| send(k) == b.send(k) }.inspect
    attributes.map{|k,v| send(k) == b.send(k) }.
      reject { true }.empty?
  end

end
