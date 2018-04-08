defmodule KillBill.RestSession do
    
    require Logger

    #%% POST /session/<user_type>
    def handle(<<"POST">>, [<<"clients">>], request) do
        Logger.info("POST /session/clients: #{inspect request}")    
    end
end 