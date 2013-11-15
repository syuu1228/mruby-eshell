
module EShell::Exit
  def self.included(klass)
    command = ExitCommand.new
    EShell.register("quit", command)
    EShell.register("exit", command)
  end

  class ExitCommand < ::EShell::CommandBase
    def exec(*args)
      exit
    end

    def help(name)
      puts name
    end
  end
end

