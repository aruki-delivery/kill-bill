defmodule KillBill.Session do
    use GenServer  

    require Logger

    def start_link(state) do
        Logger.info("Bang bang starting session start_link(#{inspect state})...")
        Supervisor.start_link([], [strategy: :one_for_one, name: KillBill.Session.Supervisor])
    end

    def init(_sessions) do
         sessions = Gibreel.create_cache(:kb_default_sessions,  [
            {:get_value_function, :none},
            {:max_age, 3600},
            {:purge_interval, 8600},
            {:cluster_nodes, :all}])

        {:ok, sessions}
    end
end