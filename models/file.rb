class File
  attr_reader :content, :name, :folder
  def initialize(attributes = {})
    @name = attributes[:name]
    @content = attributes[:content] || 'no content'
    @folder = attributes[:folder] || 'main'
  end
end
