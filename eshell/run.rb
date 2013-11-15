
module EShell::Run
  def self.included(klass)
    EShell.register("run", RunCommand.new)
  end

  class RunCommand < ::EShell::CommandBase
    def exec(*args)
      fn = args[0]
      unless fn
        puts "run requires more argument"
        return
      end
      f = File.open(fn)
      prog = f.read
      eval(prog)
    end

    def help(name)
      puts "run <file>"
    end
  end
end

