kind = "service-resolver",
name = "l7-api"

subsets = {
	"v1" = {
		filter = "Service.Meta.version == 1"
	}
	"v2" = {
		filter = "Service.Meta.version == 2"
	}
}
