cxx_plugin do

  require 'errorparser/clang_compiler_error_parser'
  toolchain "clang",
    :COMPILER =>
      {
        :CPP =>
          {
            :COMMAND => "clang++",
            :DEFINE_FLAG => "-D",
            :OBJECT_FILE_FLAG => "-o",
            :INCLUDE_PATH_FLAG => "-I",
            :COMPILE_FLAGS => "-c -W",
            :DEP_FLAGS => "-MMD -MF ", # empty space at the end is important!
            :ERROR_PARSER => Cxxproject::ClangCompilerErrorParser.new
          },
        :C =>
          {
            :BASED_ON => :CPP,
            :COMMAND => "clang",
            :COMPILE_FLAGS => "-c -W",
            :DEP_FLAGS => "-MMD -MF ", # empty space at the end is important!
            :ERROR_PARSER => Cxxproject::ClangCompilerErrorParser.new
          },
        :ASM =>
          {
            :BASED_ON => :C,
          }
      },
    :LINKER =>
      {
        :COMMAND => "clang++",
        :SCRIPT => "-T",
        :USER_LIB_FLAG => "-l:",
        :EXE_FLAG => "-o",
        :LIB_FLAG => "-l",
        :LIB_PATH_FLAG => "-L",
        :START_OF_WHOLE_ARCHIVE => {:UNIX => '-Wl,--whole-archive'},
        :END_OF_WHOLE_ARCHIVE => {:UNIX => '-Wl,--no-whole-archive'}
      },
    :ARCHIVER =>
      {
        :COMMAND => "ar",
        :ARCHIVE_FLAGS => "r"
      }

end
