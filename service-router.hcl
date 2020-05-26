kind = "service-router"
name = "l7-api"
routes = [
	{
		match {
			http {
				header = [
					{
						name = "v2"
						exact = "true"
					}
				]
			}
		}

		destination {
			service = "l7-api"
			service_subset = "v2"
		}
	},
	{
		match {
			http {
				path_prefix = "/v2"
			}
		}

		destination {
			service = "l7-api"
			service_subset = "v2"
		}
	},
	{
		match {
			http {
				query_param = [
					{
						name = "v2"
						present = true	
					}
				]
			}
		}

		destination {
			service = "l7-api"
			service_subset = "v2"
		}
	}
]
