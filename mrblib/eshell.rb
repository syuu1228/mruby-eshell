module EShell
  class CommandBase
    def exec(*args)
    end

    def help(name)
    end
  end

  def self.require(path)
    basedir = File.dirname File.realpath(__FILE__)
    open("#{basedir}/#{path}.rb", "rb") do |fp|
      source = fp.read
      eval(source)
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
    EShell.require "eshell/_loader"


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
