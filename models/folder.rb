class Folder
  attr_accessor :name
  attr_writer :open
  def initialize(attributes = {})
    @name = attributes[:name]
    @open = false
  end
end
