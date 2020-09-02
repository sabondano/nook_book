import Config

name = "sebastian"

config :libcluster,
  topologies: [
    nook_book: [
      strategy: Cluster.Strategy.Epmd,
      config: [
        hosts: [
          :"nook_book@10.0.1.237",
          :"nook_book@10.0.1.117"
        ]
      ]
    ]
  ]

config :nook_book, cluster_role: System.get_env("CLUSTER_ROLE", "member") |> String.to_atom()

config :nook_book, NookBookWeb.Endpoint,
  server: true,
  http: [port: 4000],
  url: [host: "#{name}.nookbook.online"],
  secret_keybase: "dvSyRz8WDLW1vst8s0OUeCapZ0qJM5grZ+2L8NibWLCfxDypIHaUu0of8g+nclzx"
