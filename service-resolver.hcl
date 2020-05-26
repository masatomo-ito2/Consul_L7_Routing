kind = "service-resolver",
name = "l7-api"

default_subset = "v1"

subsets = {
	"v1" = {
		filter = "Service.Meta.version == 1"
	}
	"v2" = {
		filter = "Service.Meta.version == 2"
	}
}
