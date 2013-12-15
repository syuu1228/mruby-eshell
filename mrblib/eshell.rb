require "eshell-ls"
require "eshell-run"
require "eshell-exit"
require "eshell-cat"
require "eshell-cd"
require "eshell-pwd"

module EShell
  include EShell::Ls
  include EShell::Run
  include EShell::Exit
  include EShell::Cat
  include EShell::Cd
  include EShell::Pwd

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
    @commands.each do |name, command|
      if command.is_a? EShell::CommandBase
        command.help name
      end
    end
  end

  def self.run
    puts "mruby-eshell"
    puts 

    @commands ||= {}

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
