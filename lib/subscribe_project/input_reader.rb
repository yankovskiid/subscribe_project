module SubscribeProject
  class InputReader
    def self.read_input
      puts "Please enter the items (type 'done' to finish):"
      input = ""
      while (line = STDIN.gets.chomp) != 'done'
        input += line + "\n"
      end
      input
    end
  end
end
