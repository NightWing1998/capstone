# This file deploys code to blue containers
kubectl apply -f ./blue_controller.json

kubectl describe service

kubectl apply -f ./blue-green-lb.json