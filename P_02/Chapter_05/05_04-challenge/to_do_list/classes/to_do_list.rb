class ToDoList
  include Enumerable

  attr_reader :items

  def initialize(items=[])
    @items = items
  end

  def each
    @items.each {|item| yield(item) }
  end

  def map 
    @items.map {|item| yield(item) }
  end

  def <<(new_item)
    @items.unshift(new_item)
  end

end