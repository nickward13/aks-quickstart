RESOUCEGROUP=aks-group
CLUSTERNAME=aksCluster

echo "Creating resource group..."
az group create --name $RESOURCEGROUP --location westus2
echo "Creating AKS cluster..."
az aks create --resource-group $RESOURCEGROUP --name $CLUSTERNAME --generate-ssh-keys --agent-count 1
echo "Connecting to AKS cluster..."
az aks get-credentials --resource-group $RESOURCEGROUP --name $CLUSTERNAME
echo "Get kube nodes..."
kubectl get nodes
echo "Create the azure-vote application..."
kubectl create -f azure-vote.yml
echo "Get status of kube service..."
kubectl get service azure-vote-front --watch
