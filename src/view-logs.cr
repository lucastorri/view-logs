require "./view-logs/*"

module View::Main

    groups = Logs.new ARGV[0]
    Server.new 8080, groups

end
