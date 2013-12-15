
require "eshell/ls"
require "eshell/run"
require "eshell/exit"
require "eshell/cat"
require "eshell/cd"
require "eshell/pwd"

module EShell
  include EShell::Ls
  include EShell::Run
  include EShell::Exit
  include EShell::Cat
  include EShell::Cd
  include EShell::Pwd
end

