# run in k8s
## use command
kubectl run -it --image=lockdown56/nettool nettool bash

## use yaml
run ` kubectl apply -f nettool.yaml `

nettool.yaml
```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    run: nettool
  name: nettool
spec:
  replicas: 1
  selector:
    matchLabels:
      run: nettool
  template:
    metadata:
      labels:
        run: nettool
    spec:
      containers:
      - image: lockdown56-docker.pkg.coding.net/registry/public/nettool
        imagePullPolicy: Always
        name: nettool
        command: ["bash"]
        args: ["-c", "while true; do echo hello > /dev/null; sleep 10; done"]
      restartPolicy: Always
```
