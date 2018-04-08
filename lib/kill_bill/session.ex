defmodule KillBill.Session do
    use GenServer  

    require Logger

    def start_link(state) do
        Logger.info("#{__MODULE__}.start_link(#{inspect state})...")
        Supervisor.start_link([], [strategy: :one_for_one, name: KillBill.Session.Supervisor])
    end

    def init(sessions) do
      Logger.info("#{__MODULE__}.init(#{inspect sessions})...")
      sessions = Gibreel.create_cache(:kb_default_sessions,  [
        {:get_value_function, :none},
        {:max_age, 3600},
        {:purge_interval, 8600},
        {:cluster_nodes, :all}])

      {:ok, sessions}
    end
end