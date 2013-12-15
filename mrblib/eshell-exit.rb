
module EShell::Exit
  class ExitCommand < ::EShell::CommandBase
    def exec(*args)
      exit
    end

    def help(name)
      puts name
    end
  end
end

