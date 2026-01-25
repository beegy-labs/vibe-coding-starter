# GitOps Infrastructure (ArgoCD)

> Enterprise-grade Kubernetes infrastructure for multi-cluster bare metal

## Structure

```
infra/
+-- metal/                       # [BARE METAL] Server provisioning
|   +-- inventory/               # Ansible inventory
|   |   +-- group_vars/          # Cluster variables
|   |   +-- hosts.yaml           # Server definitions
|   +-- playbooks/               # Ansible playbooks
|       +-- k8s-cluster/         # Cluster setup
|       +-- node-setup/          # Node configuration
|
+-- bootstrap/                   # [INIT] First-time cluster setup
|   +-- argocd/                  # ArgoCD installation
|   +-- sealed-secrets/          # Secret management init
|
+-- clusters/                    # [MULTI-CLUSTER] Per-cluster configs
|   +-- {cluster}/               # dev, staging, prod, edge
|       +-- applicationsets/     # ArgoCD ApplicationSets
|       +-- namespaces/          # Namespace definitions
|       +-- prometheus-rules/    # Cluster-specific alerts
|       +-- values/              # Environment-specific values
|
+-- infrastructure/              # [CORE] Cluster infrastructure
|   +-- argocd/                  # ArgoCD config
|   |   +-- applications/
|   |   +-- projects/
|   +-- cilium/                  # CNI + Service Mesh
|   |   +-- cilium-lbipam/       # Load balancer IP management
|   |   +-- cilium-gateway/      # Gateway API
|   +-- metrics-server/          # [REQUIRED] HPA, kubectl top
|   +-- storage/                 # Storage solutions
|   |   +-- local-storage/       # Local path provisioner
|   |   +-- longhorn/            # Distributed storage
|   +-- dns/                     # DNS management
|   |   +-- coredns/             # Internal DNS
|   |   +-- external-dns/        # External DNS sync
|   +-- ingress/                 # Ingress/Gateway
|       +-- gateway-api/         # Gateway API CRDs
|       +-- cloudflare-tunnel/   # Cloudflare tunnel
|
+-- platform/                    # [PLATFORM] Shared services
|   +-- monitoring/              # Observability stack
|   |   +-- prometheus/          # Metrics
|   |   +-- grafana/             # Dashboards
|   |   +-- loki/                # Logs
|   |   +-- vector/              # Log shipper
|   +-- security/                # Security stack
|   |   +-- vault/               # Secret management
|   |   +-- external-secrets/    # K8s secret sync
|   |   +-- trivy/               # Vulnerability scanning
|   +-- ci-cd/                   # CI/CD components
|   |   +-- github-runner/       # Self-hosted runners
|   |   +-- keda/                # Event-driven autoscaling
|   +-- data/                    # Data services
|   |   +-- postgres/            # PostgreSQL operator
|   |   +-- clickhouse/          # ClickHouse
|   |   +-- valkey/              # Valkey (Redis fork)
|   |   +-- redpanda/            # Kafka alternative
|   +-- backup/                  # Backup solutions
|       +-- velero/              # K8s backup
|
+-- apps/                        # [APPS] Application deployments
    +-- _defaults/               # Shared Helm components
    |   +-- components/
    +-- {project}/               # Project grouping
        +-- {service}/
            +-- Chart.yaml
            +-- values.yaml
            +-- templates/
```

## Multi-Cluster Strategy

### Cluster Types

| Cluster | Purpose | Location | HA |
|---------|---------|----------|-----|
| dev | Development | Cloud/Local | No |
| staging | Pre-production | Bare metal | Yes |
| prod | Production | Bare metal | Yes |
| edge | Edge computing | Remote sites | No |

### Cluster Config

```
clusters/
+-- dev/                    # Development cluster
|   +-- values/             # Dev-specific values
+-- staging/                # Staging cluster
|   +-- values/             # Staging values
+-- prod/                   # Production cluster
|   +-- values/             # Prod values
|   +-- prometheus-rules/   # Prod-only alerts
+-- edge/                   # Edge clusters
    +-- values/             # Minimal footprint
```

## Bare Metal Setup

### Prerequisites

- Ansible 2.15+
- SSH access to all nodes
- Ubuntu 22.04+ or Rocky Linux 9+

### Quick Start

```bash
# 1. Configure inventory
cp infra/metal/inventory/hosts.yaml.example infra/metal/inventory/hosts.yaml
vim infra/metal/inventory/hosts.yaml

# 2. Run node setup
cd infra/metal
ansible-playbook -i inventory/hosts.yaml playbooks/node-setup/main.yaml

# 3. Install K8s cluster
ansible-playbook -i inventory/hosts.yaml playbooks/k8s-cluster/main.yaml

# 4. Bootstrap ArgoCD
kubectl apply -k infra/bootstrap/argocd/
```

### Inventory Example

```yaml
# infra/metal/inventory/hosts.yaml
all:
  children:
    k8s_cluster:
      children:
        control_plane:
          hosts:
            master-01: { ansible_host: 192.168.1.10 }
            master-02: { ansible_host: 192.168.1.11 }
            master-03: { ansible_host: 192.168.1.12 }
        workers:
          hosts:
            worker-01: { ansible_host: 192.168.1.20 }
            worker-02: { ansible_host: 192.168.1.21 }
            worker-03: { ansible_host: 192.168.1.22 }
```

## ArgoCD Application Patterns

### ApplicationSet (Recommended)

```yaml
# clusters/{cluster}/applicationsets/apps.yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: apps
spec:
  generators:
    - git:
        repoURL: https://github.com/org/repo
        revision: HEAD
        directories:
          - path: infra/apps/*/*
  template:
    metadata:
      name: '{{path.basename}}'
    spec:
      project: default
      source:
        repoURL: https://github.com/org/repo
        targetRevision: HEAD
        path: '{{path}}'
        helm:
          valueFiles:
            - values.yaml
            - ../../clusters/{{cluster}}/values/{{path.basename}}.yaml
```

### Per-Cluster Values

```yaml
# clusters/prod/values/api-service.yaml
image:
  tag: v1.2.3
replicas: 3
resources:
  requests:
    cpu: 500m
    memory: 512Mi
  limits:
    cpu: 2000m
    memory: 2Gi
```

## Infrastructure Components

### Bare Metal Essentials

| Component | Purpose | Required |
|-----------|---------|----------|
| Cilium | CNI + LB + Gateway | Yes |
| Metrics Server | HPA, kubectl top | Yes |
| Local Storage | Persistent volumes | Yes |
| MetalLB/Cilium LBIPAM | Load balancer IPs | Yes |
| CoreDNS | Internal DNS | Yes |

### Optional Components

| Component | Purpose | When to Use |
|-----------|---------|-------------|
| Longhorn | Distributed storage | Multi-node storage |
| Cloudflare Tunnel | External access | No public IP |
| External DNS | DNS automation | Dynamic DNS needed |

## Commands

```bash
# Bootstrap new cluster
kubectl apply -k infra/bootstrap/argocd/

# Sync all apps
argocd app sync -l argocd.argoproj.io/instance=apps

# Check cluster health
argocd app list

# Diff before sync
argocd app diff my-app

# Rollback
argocd app rollback my-app
```

## Directory Creation

```bash
# Add new cluster
mkdir -p infra/clusters/{cluster}/{applicationsets,namespaces,values}

# Add new platform service
mkdir -p infra/platform/{category}/{service}/templates

# Add new app
mkdir -p infra/apps/{project}/{service}/templates
```
