class File
  attr_accessor :content, :name
  def initialize(attributes = {})
    @name = attributes[:name]
    @content = attributes[:content] || 'no content'
  end
end
