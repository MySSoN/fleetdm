FleetDM Kubernetes Deployment Guide

Posible Improvements:
1. Enable TLS for FleetDM web API (Ingress with HTTPS)
2. Enable HTTPS access for Fleet and update Kubernetes manifests
3. Move more configuration to ConfigMaps & Secrets for better maintainability

Installation Guide:

0. Create namespace 'test' manually or apply:
   kubectl apply -f ./namespace.yaml

1. Create Secrets:
   kubectl apply -f ./secrets.yaml

2. Deploy MySQL 8.x:
   kubectl apply -f ./mysql.yaml
   Note: If you need persistent volumes, uncomment volume sections in mysql.yaml (maps host directory in k3s)

3. Initialize Fleet Database:
   Run init job and wait until it completes:
   kubectl apply -f ./fleetdm-full-init-job.yaml

4. Deploy FleetDM Application:
   kubectl apply -f ./fleetdm.yaml

5. Expose FleetDM Web Service:

   5.1 Port-forward (for development):
       kubectl port-forward svc/fleetdm 8080:8080 --address 0.0.0.0 -n test

   5.2 Ingress Example:
       kubectl apply -f ./ingress-nginx-example.yaml

Notes:
- Secrets (passwords, credentials) are stored in fleetdb-secrets.yaml
- Configurations like DB and Redis addresses are in fleetdm-config.yaml
- TLS and HTTPS ingress setup is recommended for production
