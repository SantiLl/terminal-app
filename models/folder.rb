class Folder
  attr_reader :name, :directory
  attr_accessor :open
  def initialize(attributes = {})
    @name = attributes[:name]
    @open = false
    @directory = attributes[:directory]
  end
end
