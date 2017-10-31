echo "Creating resource group..."
az group create --name myResourceGroup --location westus2
echo "Creating AKS cluster..."
az aks create --resource-group myResourceGroup --name myK8sCluster --generate-ssh-keys --agent-count 1
echo "Connecting to AKS cluster..."
az aks get-credentials --resource-group=myResourceGroup --name=myK8sCluster
echo "Get kube nodes..."
kubectl get nodes
echo "Create the azure-vote application..."
kubectl create -f azure-vote.yml
echo "Get status of kube service..."
kubectl get service azure-vote-front --watch
