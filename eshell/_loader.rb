
EShell.require "eshell/ls"
EShell.require "eshell/run"
EShell.require "eshell/exit"
EShell.require "eshell/cat"
EShell.require "eshell/cd"
EShell.require "eshell/pwd"

module EShell
  include EShell::Ls
  include EShell::Run
  include EShell::Exit
  include EShell::Cat
  include EShell::Cd
  include EShell::Pwd
end

