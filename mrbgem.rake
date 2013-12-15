MRuby::Gem::Specification.new('mruby-eshell') do |spec|
  spec.license = 'MIT'
  spec.author  = 'syuu1228'
  spec.add_dependency 'mruby-eval'
  spec.add_dependency 'mruby-io'
  spec.add_dependency 'mruby-regexp-pcre'
  spec.add_dependency 'mruby-dir'
  spec.add_dependency 'mruby-exit'
  spec.add_dependency 'mruby-require'
  spec.rbfiles = Dir.glob(["#{dir}/mrblib/*.rb", "#{dir}/mrblib/*/*.rb"])
end
