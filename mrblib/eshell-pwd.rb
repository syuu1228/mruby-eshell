
module EShell::Pwd
  class PwdCommand < ::EShell::CommandBase
    def exec(*args)
      puts Dir.getwd
    end

    def help(name)
      puts "pwd"
    end
  end
end

