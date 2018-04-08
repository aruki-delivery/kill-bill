defmodule KillBill do
    use GenServer  
    require Logger


    def start_link(state) do
        import Supervisor.Spec
        Logger.info("Bang bang starting start_link(#{inspect state})...")
        
        Logger.info("Bang bang starting kill_bill_supervisor...")
        children = [
            supervisor(:kill_bill_sup, []),
            #supervisor(:kb_resource_sup, []),
            #worker(:kill_bill, []),
        ]
        
        {:ok, super_pid} = Supervisor.start_link(children, [strategy: :one_for_one, name: KillBill.Supervisor])
        Logger.info("Bang bang started kill_bill_supervisor: #{inspect super_pid}")
        {:ok, super_pid}
    end

    def init(state) do
        {:ok, state}
    end
  end