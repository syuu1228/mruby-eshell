
module EShell::Cat
  class CatCommand < ::EShell::CommandBase
    def exec(*args)
      fn = args[0]
      unless fn
        puts "cat requires more argument"
        return
      end
      f = File.open(fn)
      puts f.read
      f.close
    end

    def help(name)
      puts "cat <file>"
    end
  end
end

