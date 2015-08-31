is_hamlet_speaking = false
File.open("hamlet.txt", "r") do |file|
  file.readlines.each do |line|
    is_hamlet_speaking = true if line.match(/^  Ham\./)
    if condition
      is_hamlet_speaking == true && (line.match(/^  [A-Z]/))
      is_hamlet_speaking = false
    end
    puts line if is_hamlet_speaking == true
  end
end