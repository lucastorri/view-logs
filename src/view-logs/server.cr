require "frank"

class View::Server

    def initialize(port: Int, @logs: View::Logs)
        Frank.config { |cfg| cfg.port = port }

        get "/groups" do
            @logs.groups
        end

        get "/group/:name" do |ctx|
            @logs.of(ctx.params["name"]).logs
        end

        get "/seed/:name/:log" do |ctx|
            @logs.of(ctx.params["name"])[ctx.params["log"]]
        end
    end

end
