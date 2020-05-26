# PLEASE NOTE: If you copy this file, be sure to replace <YOUR HOSTNAME>
# in the first line and in the "tags" section.
# Your hostname can be attained by running the "identity" command on your node.

job "L7-splitter" {
	region = "local"
  datacenters = ["consul_cluster"]

	group "l7-echo" {
    count = 1	 

    task "l7-echo" {
      driver = "docker"

			meta {
				#version = "0.1.8"   
			}

      config {
        image = "nicholasjackson/upstream-echo:v0.1.8"
      }

			env {
				"LISTEN_ADDR" = "0.0.0.0:${NOMAD_PORT_echo}"
				"UPSTREAM_ADDR" = "localhost:9091"
				"UPSTREAM_CALL" = "true"
				"MESSAGE" = "Querying: l7-api.service.consul:8989"
				"HTTP_CLIENT_KEEP_ALIVES" = "false"
			}

			resources {
				cpu = 100
				memory = 16
			}
    }

		network {
			port "echo" {
				static = 8989
				to = 8989	
			}
			mode = "bridge"
		}

		service {
			name = "l7-echo"
			port = "echo"

			tags = [
				"masa_demo"
			]

			connect {
				sidecar_service {
					proxy {
						upstreams {
							destination_name = "l7-api"
							local_bind_port = 9091
						}
					}
				}
			}
		} // service

  } // group v1

	// Job group for API v1
	group "l7-api-v1" {
    count = 1	 

    task "l7-api-v1" {
      driver = "docker"

			env {
				"LISTEN_ADDR" = "0.0.0.0:${NOMAD_PORT_api_v1}"
				"MESSAGE" = "Service V1"
			}

      config {
        image = "nicholasjackson/upstream-echo:v0.1.8"
      }

			resources {
				cpu = 100
				memory = 16
			}
    }

		network {
			port "api_v1" {
				to = -1	
			}
			mode = "bridge"
		}

		service {
			name = "l7-api"
			port = "api_v1"

			tags = [
				"masa_demo", 
				"v1"
			]

			meta {
				version = "1"
			}

			connect {
				sidecar_service {}
			}
		}

  } // group


	// Job group for API v2
	group "l7-api-v2" {
    count = 1	 

		meta {
			VERSION = "2"   
		}

    task "l7-api-v2" {
      driver = "docker"

			env {
				"LISTEN_ADDR" = "0.0.0.0:${NOMAD_PORT_api_v2}"
				"MESSAGE" = "Service V2"
			}

      config {
        image = "nicholasjackson/upstream-echo:v0.1.8"
      }

			resources {
				cpu = 100
				memory = 16
			}

    }

		network {
			port "api_v2" {
				to = -1	
			}
			mode = "bridge"
		}

		service {
			name = "l7-api"
			port = "api_v2"

			tags = [
				"masa_demo", 
				"v2"
			]

			meta {
				version = "2"
			}

			connect {
				sidecar_service {}
			}
		}

  } // group
} // job
