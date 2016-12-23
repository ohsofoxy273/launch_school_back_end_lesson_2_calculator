
class School

  def initialize
    @roster = {}
  end

  def add(name, grade)
    if @roster[grade]
      @roster[grade] << name
      @roster[grade] = @roster[grade].sort 
    else
      @roster[grade] = [name]
    end
  end

  def to_h
    @roster.sort.to_h
  end

  def grade(num)
    return [] unless @roster[num]
    @roster[num].sort
  end
end