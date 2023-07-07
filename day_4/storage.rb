class Storage
  attr_accessor :storage_name

  def initialize
    @storage_name = "Storage"
    @contents = []
  end

  def change_name(name = "")
    return if name.empty?

    @storage_name = name
  end

  def add_content(content = {})
    return if content.empty?
    return if content

    @contents.push(content)
  end

  def edit_content(query = '', changes = {})
    return if query.empty?
    return if changes.empty?

    @contents.each { |content|
      if content['name'].downcase == query.downcase
        content['name'] = changes['name']
      end
    }
  end

  def delete_content(query = "")
    return if query.empty?

    @contents.delete_if { |content|
      content['name'].downcase == query.downcase
    }
  end
end
