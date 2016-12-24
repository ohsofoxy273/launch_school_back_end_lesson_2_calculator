class TextAnalyzer
  def process(&block)
    file = File.open("original.txt", "r")
    yield(file)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.read.split.size} words" }
analyzer.process { |file| puts file.read.count("\n").to_s + " lines" }
analyzer.process { |file| puts file.read.count("\n\n").to_s + " paragraphs."  }
