defmodule KillBill do
    use GenServer  
    require Logger


    def start_link(state) do
        import Supervisor.Spec
        Logger.info("#{__MODULE__}.start_link(#{inspect state})...")
        Logger.info("#{__MODULE__} starting kill_bill_supervisor...")
        children = [supervisor(:kill_bill_sup, []),]
        {:ok, super_pid} = Supervisor.start_link(children, [strategy: :one_for_one, name: KillBill.Supervisor])
        Logger.info("#{__MODULE__} started kill_bill_supervisor: #{inspect super_pid}")
        {:ok, super_pid}
    end

    def init(state) do
        {:ok, state}
    end
  end