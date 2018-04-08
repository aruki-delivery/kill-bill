defmodule KillBill.Application do
    use Application
    require Logger

    def start(type, args) do
        Logger.info("Starting KillBill.Application.start(#{inspect type}}, #{inspect args})...")
        {:ok, killbill_sup} = Supervisor.start_link([KillBill], [strategy: :one_for_one, name: KillBill.Application.Supervisor])
        Logger.info("started KillBill.Gibreel.Supervisor - #{inspect killbill_sup}")

        children = [           
            %{
                id: KillBill.Session,
                start: {KillBill.Session, :start_link, [[{:get_value_function, :none}, {:max_age, 3600}, {:purge_interval, 8600}, {:cluster_nodes, :all}]]}
            },
        ]
        config = args[:default_webapp_config]
        port = args[:default_rest_port]
        
        Logger.info("Starting kill_bill on default port: #{port}")
        server_config = {
          :server_config,
          :default,
          [{:port, port}]
        }

        Logger.info("Configuring kill_bill.config_server(#{inspect server_config})...")
        {:ok, server} = :kill_bill.config_server(server_config)
        Logger.info("configured server: #{server}")
        
        Logger.info("Deploying server #{inspect server} with config #{inspect config})...")
        :ok = :kill_bill.deploy(server, config)

        {:ok, super_pid} = Supervisor.start_link(children, [strategy: :one_for_one, name: KillBill.Endpoint.Supervisor])
        {:ok, super_pid}
    end
  end