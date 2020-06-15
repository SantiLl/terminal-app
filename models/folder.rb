class Folder
  attr_reader :name, :folder
  attr_accessor :open
  def initialize(attributes = {})
    @name = attributes[:name]
    @open = false
    @folder = attributes[:folder] || 'main'
  end
end
