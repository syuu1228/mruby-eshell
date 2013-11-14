
module EShell::Cd
  def self.included(klass)
    EShell.register("cd", CdCommand.new)
  end

  class CdCommand < ::EShell::CommandBase
    def exec(*args)
      dir = args[0]
      dir = "." if dir == nil
      ret = Dir.chdir(dir)
      puts "failed to chdir to #{dir}" if (ret != 0)
    end

    def help(name)
      puts "cd <dir>"
    end
  end
end

