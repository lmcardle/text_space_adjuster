class AnalyzeText
  
  def self.analyze(text)
    results = Hash.new
    results[:new_text] = text.gsub(/[.]\s\s/, ". ")
    results[:fix_count] = text.scan(/[.]\s\s/).size
    results
  end
end