class Folder
  attr_accessor :name, :open
  def initialize(attributes = {})
    @name = attributes[:name]
    @open = false
  end
end
