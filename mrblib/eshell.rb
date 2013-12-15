module EShell
  class CommandBase
    def exec(*args)
    end

    def help(name)
    end
  end

  def self.register(name, klass)
    @commands ||= {}
    @commands[name] = klass
  end

  def self.help
    puts "Help"
    @commands.each do |name, command|
      if command.is_a? EShell::CommandBase
        command.help name
      end
    end
  end

  def self.run
    puts "mruby-eshell"
    puts 

    loop do
      print "$ "

      begin
        args = gets.chop.split(/ /)
      rescue NoMethodError => e
        puts
        next
      end

      name = args.shift # $0

      if @commands.key? name
        begin
          command = @commands[name]
          if command.is_a? EShell::CommandBase
            command.send(:exec, *args)
          end
        rescue => e
          p e
        rescue SyntaxError => e
          p e
        end
      else
        help
      end
    end
  end
end

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

module EShell::Cd
  class CdCommand < ::EShell::CommandBase
    @@last = "/"
    def exec(*args)
      dir = args[0]
      dir = "/" if dir == nil
      dir = @@last if dir == "-"
      @@last = Dir.getwd
      Dir.chdir(dir)
    end

    def help(name)
      puts "cd <dir>"
    end
  end
end

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


module EShell::Run
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

EShell.register("cat", EShell::Cat::CatCommand.new)
EShell.register("exit", EShell::Exit::ExitCommand.new)
EShell.register("ls", EShell::Ls::LsCommand.new)
EShell.register("pwd", EShell::Pwd::PwdCommand.new)
EShell.register("run", EShell::Run::RunCommand.new)
