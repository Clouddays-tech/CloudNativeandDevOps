#! /bin/bash

SUBID=$(az account show --query id --output tsv)
echo $SUBID

tf init
tf plan -var="subscription_id=${SUBID}" -out tfplan
tf apply tfplan

tf destroy -auto-approve -var="subscription_id=${SUBID}"

# For Azure RBAC 
AKS_CLUSTER=$(az aks show --resource-group rg-aks-cluster-eus --name my-aks-cluster-eus --query id -o tsv)
AD_GROUPID=$(az ad group show --group k8-admins --query id -o tsv)

az role assignment create \
    --assignee $AD_GROUPID \
    --scope $AKS_CLUSTER \
    --role "Azure Kubernetes Service Cluster Admin Role" \
    ; sleep 10

# az aks get-credentials --resource-group rg-aks-cluster-eus --name my-aks-cluster-eus
az aks get-credentials --resource-group rg-aks-cluster-eus --name my-aks-cluster-eus --admin

kubectl create ns pets
kubectl apply -f https://raw.githubusercontent.com/Azure-Samples/aks-store-demo/main/aks-store-all-in-one.yaml -n pets


## Terraform code need to update managed identity RBAC permission to VNET to update app gateway subnet.