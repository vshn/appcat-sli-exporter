module github.com/vshn/appcat-sli-exporter

go 1.16

require (
	github.com/golang/mock v1.6.0
	github.com/imdario/mergo v0.3.12 // indirect
	github.com/vshn/component-appcat/apis v0.0.0-20230323120435-814284eb8a95
	k8s.io/apimachinery v0.26.0
	k8s.io/client-go v0.26.0
	sigs.k8s.io/controller-runtime v0.14.1
	sigs.k8s.io/controller-tools v0.10.0
	sigs.k8s.io/kind v0.17.0
	sigs.k8s.io/kustomize/kustomize/v4 v4.5.7
)
