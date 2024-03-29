module github.com/zenmodel/zenmodel-contrib/brain/openai_agent_with_tools

go 1.21.0

replace (
	github.com/zenmodel/zenmodel-contrib => ./../../
	github.com/zenmodel/zenmodel-contrib/processor/calltools => ./../../processor/calltools
	github.com/zenmodel/zenmodel-contrib/processor/openaichat => ./../../processor/openaichat
)

require (
	github.com/sashabaranov/go-openai v1.20.4
	github.com/zenmodel/zenmodel v0.0.0-20240328171455-5432f4553e23
	github.com/zenmodel/zenmodel-contrib v0.0.0-00010101000000-000000000000
	github.com/zenmodel/zenmodel-contrib/processor/calltools v0.0.0-00010101000000-000000000000
	github.com/zenmodel/zenmodel-contrib/processor/openaichat v0.0.0-00010101000000-000000000000
)

require (
	github.com/cespare/xxhash/v2 v2.1.1 // indirect
	github.com/dgraph-io/ristretto v0.1.1 // indirect
	github.com/dustin/go-humanize v1.0.0 // indirect
	github.com/go-logr/logr v1.3.0 // indirect
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	go.uber.org/multierr v1.10.0 // indirect
	go.uber.org/zap v1.27.0 // indirect
	golang.org/x/sys v0.15.0 // indirect
	golang.org/x/time v0.3.0 // indirect
	k8s.io/apimachinery v0.29.2 // indirect
	k8s.io/client-go v0.29.2 // indirect
	k8s.io/klog/v2 v2.110.1 // indirect
	k8s.io/utils v0.0.0-20230726121419-3b25d923346b // indirect
)
