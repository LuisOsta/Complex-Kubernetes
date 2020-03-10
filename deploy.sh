# Build images
docker build -t luisosta/multi-client:latest -t luisosta/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t luisosta/multi-server:latest -t luisosta/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t luisosta/multi-worker:latest -t luisosta/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# Then push
docker push luisosta/multi-client:latest
docker push luisosta/multi-server:latest
docker push luisosta/multi-worker:latest

docker push luisosta/multi-client:$SHA
docker push luisosta/multi-server:$SHA
docker push luisosta/multi-worker:$SHA

kubectl apply -f k8s

# Update the images in the deployments with the latest
kubectl set image deployments/server-deployment server=luisosta/multi-server:$SHA
kubectl set image deployments/client-deployment client=luisosta/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=luisosta/worker-server:$SHA
