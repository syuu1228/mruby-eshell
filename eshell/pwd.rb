
module EShell::Pwd
  def self.included(klass)
    EShell.register("pwd", PwdCommand.new)
  end

  class PwdCommand < ::EShell::CommandBase
    def exec(*args)
      puts Dir.getwd
    end

    def help(name)
      puts "pwd"
    end
  end
end

