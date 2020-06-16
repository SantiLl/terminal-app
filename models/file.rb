class File
  attr_reader :content, :name, :directory
  def initialize(attributes = {})
    @name = attributes[:name]
    @content = attributes[:content] || 'no content'
    @directory = attributes[:directory]
  end
end
