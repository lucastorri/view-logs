require "file"
require "dir"

class View::Logs

    def initialize(@path: String)
        raise Exception.new("#{@path} is not a directory") unless File.directory?(@path)
    end

    def groups: Array(String)
        dir = Dir.new @path
        dir.to_a[2..-1] # get rid of '.' and '..'
    end

    def of(name: String): LogGroup
        seed_path = "#{@path}/#{name}"
        File.directory?(seed_path) ? SomeLogGroup.new seed_path : EmptyLogGroup.new
    end

end

class View::LogGroup

    abstract def is_empty?: Boolean

    def logs: Array(String)
        [] of String
    end

    def [](log: String): String
        ""
    end

end

class View::SomeLogGroup < View::LogGroup

    def initialize(@path: String)
    end

    def is_empty?: Boolean
        false
    end

    def logs: Array(String)
        dir = Dir.new @path
        dir.to_a[2..-1] # get rid of '.' and '..'
    end

    def [](log: String): String
        File.read "#{@path}/#{log}"
    end

end

class View::EmptyLogGroup < View::LogGroup

    def is_empty?: Boolean
        true
    end

end
