
module EShell::Ls
  def self.included(klass)
    EShell.register("ls", LsCommand.new)
  end

  class LsCommand < ::EShell::CommandBase
    def exec(*args)
      dir = args[0]
      dir = "." if dir == nil
      Dir.entries(dir).each do |f|
        puts "#{f}\t#{File.size(f)}"
      end
    end

    def help(name)
      puts "ls <dir>"
    end
  end
end

