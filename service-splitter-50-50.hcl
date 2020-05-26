kind = "service-splitter"
name = "l7-api"
splits = [
	{
    weight = 50
    service_subset = "v1"
	},
	{
    weight = 50
		service_subset = "v2"
	}
]
