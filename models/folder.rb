class Folder
  attr_accessor :name, :open, :folder
  def initialize(attributes = {})
    @name = attributes[:name]
    @open = false
    @folder = attributes[:folder] || 'main'
  end
end
