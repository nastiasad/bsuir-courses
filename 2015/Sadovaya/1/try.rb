5.times {
  for i in 1..8
    IO.foreach("text#{i}.txt") do |line|
      puts line
    end
    sleep 0.2
    system("clear")
  end
}
