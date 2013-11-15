
EShell.require "eshell/ls"
EShell.require "eshell/run"
EShell.require "eshell/exit"

module EShell
  include EShell::Ls
  include EShell::Run
  include EShell::Exit
end

