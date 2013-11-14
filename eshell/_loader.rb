
EShell.require "eshell/ls"
EShell.require "eshell/run"
EShell.require "eshell/exit"
EShell.require "eshell/cat"

module EShell
  include EShell::Ls
  include EShell::Run
  include EShell::Exit
  include EShell::Cat
end

