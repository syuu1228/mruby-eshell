
module EShell::Ls
  class LsCommand < ::EShell::CommandBase
    def exec(*args)
      dir = args[0]
      dir = "." if dir == nil
      p Dir.entries(dir)
    end

    def help(name)
      puts "ls <dir>"
    end
  end
end

