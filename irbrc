require 'rubygems'
require 'interactive_editor'

def add_lib_path(*path)
    $LOAD_PATH.unshift(File.join(Dir.pwd, path))
end
