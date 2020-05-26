kind = "service-splitter"
name = "l7-api"
splits = [
	{
    weight = 20
    service_subset = "v1"
	},
	{
    weight = 80
		service_subset = "v2"
	}
]
