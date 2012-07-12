$:.unshift(File.dirname(__FILE__)+"/")

PKG_VERSION = "0.1.1"
PKG_FILES = FileList[
  "lib/**/*.rb"
]

Gem::Specification.new do |s|
  s.name = "cxxproject_clangtoolchain"
  s.version = PKG_VERSION
  s.summary = "toolchain support for clang."
  s.description = <<-EOF
    Toolchain supporting clang
  EOF
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.author = "oliver mueller"
  s.email = "oliver.mueller@gmail.com"
  s.homepage = "https://github.com/marcmo/cxxproject"
  s.add_dependency("cxxproject")
end
