

```bash
# Get version and pods
kubectl version
kubectl get pods
```

    Client Version: version.Info{Major:"1", Minor:"5", GitVersion:"v1.5.1", GitCommit:"82450d03cb057bab0950214ef122b67c83fb11df", GitTreeState:"clean", BuildDate:"2016-12-22T09:28:07Z", GoVersion:"go1.7.4", Compiler:"gc", Platform:"darwin/amd64"}
    Server Version: version.Info{Major:"1", Minor:"5", GitVersion:"v1.5.2", GitCommit:"08e099554f3c31f6e6f07b448ab3ed78d0520507", GitTreeState:"clean", BuildDate:"2017-01-12T04:52:34Z", GoVersion:"go1.7.4", Compiler:"gc", Platform:"linux/amd64"}
    NAME                                READY     STATUS             RESTARTS   AGE
    autotest-accounts                   2/4       ImagePullBackOff   0          6d
    elasticsearch-3ucpd                 1/1       Running            1          205d
    freegeoip-t0ab6                     1/1       Running            1          205d
    grafana-g14fe                       1/1       Running            1          136d
    hello-world-v2z8q                   1/1       Running            1          137d
    jenkins-geix4                       1/1       Running            1          163d
    nginx-deployment-4087004473-192c9   1/1       Running            0          5h
    nginx-deployment-4087004473-34jkj   1/1       Running            0          5h
    nginx-deployment-4087004473-3jbb2   1/1       Running            0          5h
    nginx-deployment-4087004473-50q6v   1/1       Running            0          5h
    prometheus-523399722-zc4sg          1/1       Running            0          10d
    snapper-f936r                       3/3       Running            3          203d


# Create k8s pods


```bash
echo 'apiVersion: v1
kind: Pod
metadata:
  name: kafka
  labels:
    app: kafka
    version: v1
spec:
  containers:
  - name: kafka
    image: confluentinc/cp-kafka:3.1.1
    ports:
    - containerPort: 9092
      protocol: TCP
    env:
    - name: KAFKA_REST_ZOOKEEPER_CONNECT
      value: kafka01:2181,kafka02:2181,kafka03:2181
    - name: KAFKA_REST_HOST_NAME
      value: kafka04.teambition.corp
    - name: KAFKA_REST_LISTENERS
      value: http://0.0.0.0:8082
    - name: KAFKA_REST_SCHEMA_REGISTRY_URL
      value: http://kafka04:8081' > kafka-rest.yml
```

    


```bash
kubectl create -f kafka-rest.yml
```

    pod "kafka-rest" created



```bash
kubectl get pods
```

    NAME                                READY     STATUS             RESTARTS   AGE
    autotest-accounts                   2/4       ImagePullBackOff   0          7d
    elasticsearch-3ucpd                 1/1       Running            1          205d
    freegeoip-t0ab6                     1/1       Running            1          205d
    grafana-g14fe                       1/1       Running            1          136d
    hello-world-v2z8q                   1/1       Running            1          137d
    jenkins-geix4                       1/1       Running            1          163d
    kafka-rest                          0/1       CrashLoopBackOff   6          8m
    nginx-deployment-4087004473-192c9   1/1       Running            0          5h
    nginx-deployment-4087004473-34jkj   1/1       Running            0          5h
    nginx-deployment-4087004473-3jbb2   1/1       Running            0          5h
    nginx-deployment-4087004473-50q6v   1/1       Running            0          5h
    prometheus-523399722-zc4sg          1/1       Running            0          10d
    snapper-f936r                       3/3       Running            3          203d



```bash
kubectl describe pods kafka-rest
```

    Name:		kafka-rest
    Namespace:	default
    Node:		k8s-master-dev/10.0.0.1
    Start Time:	Fri, 24 Feb 2017 17:11:07 +0800
    Labels:		app=kafka-rest
    		version=v1
    Status:		Running
    IP:		10.10.1.17
    Controllers:	<none>
    Containers:
      kafka-rest:
        Container ID:	docker://784a864de6c7ff5e7794f8c341f5bd502494d3f3e96f897b0094dd3ccefd0826
        Image:		confluentinc/cp-kafka-rest:3.1.1
        Image ID:		docker-pullable://docker.io/confluentinc/cp-kafka-rest@sha256:387ecb87b13d9c4c78cabea31e2f0945dce4333e6dd839940061572013f49c30
        Port:		8082/TCP
        State:		Waiting
          Reason:		CrashLoopBackOff
        Last State:		Terminated
          Reason:		Error
          Exit Code:	1
          Started:		Fri, 24 Feb 2017 17:18:00 +0800
          Finished:		Fri, 24 Feb 2017 17:18:01 +0800
        Ready:		False
        Restart Count:	6
        Volume Mounts:
          /var/run/secrets/kubernetes.io/serviceaccount from default-token-4cjhh (ro)
        Environment Variables:
          KAFKA_REST_ZOOKEEPER_CONNECT:	kafka01:2181,kafka02:2181,kafka03:2181
          KAFKA_REST_HOST_NAME:		kafka04.teambition.corp
          KAFKA_REST_LISTENERS:		http://0.0.0.0:8082
          KAFKA_REST_SCHEMA_REGISTRY_URL:	http://kafka04:8081
    Conditions:
      Type		Status
      Initialized 	True 
      Ready 	False 
      PodScheduled 	True 
    Volumes:
      default-token-4cjhh:
        Type:	Secret (a volume populated by a Secret)
        SecretName:	default-token-4cjhh
    QoS Class:	BestEffort
    Tolerations:	<none>
    Events:
      FirstSeen	LastSeen	Count	From				SubObjectPath			Type		Reason		Message
      ---------	--------	-----	----				-------------			--------	------		-------
      10m		10m		1	{default-scheduler }						Normal		Scheduled	Successfully assigned kafka-rest to k8s-master-dev
      10m		10m		1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal		Pulling		pulling image "confluentinc/cp-kafka-rest:3.1.1"
      9m		9m		1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal		Pulled		Successfully pulled image "confluentinc/cp-kafka-rest:3.1.1"
      9m		9m		1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal		Created		Created container with docker id 8ef11746fdff; Security:[seccomp=unconfined]
      9m		9m		1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal		Started		Started container with docker id 8ef11746fdff
      9m		9m		1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal		Created		Created container with docker id 69e7f6a0b5f9; Security:[seccomp=unconfined]
      9m		9m		1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal		Started		Started container with docker id 69e7f6a0b5f9
      9m		9m		2	{kubelet k8s-master-dev}					Warning		FailedSync	Error syncing pod, skipping: failed to "StartContainer" for "kafka-rest" with CrashLoopBackOff: "Back-off 10s restarting failed container=kafka-rest pod=kafka-rest_default(2cf72ef4-fa71-11e6-ba86-00163e000fbf)"
    
      8m	8m	1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Created		Created container with docker id 3fc5d0abd404; Security:[seccomp=unconfined]
      8m	8m	1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Started		Started container with docker id 3fc5d0abd404
      8m	8m	2	{kubelet k8s-master-dev}					Warning	FailedSync	Error syncing pod, skipping: failed to "StartContainer" for "kafka-rest" with CrashLoopBackOff: "Back-off 20s restarting failed container=kafka-rest pod=kafka-rest_default(2cf72ef4-fa71-11e6-ba86-00163e000fbf)"
    
      8m	8m	1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Created		Created container with docker id 8f29246df1d6; Security:[seccomp=unconfined]
      8m	8m	1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Started		Started container with docker id 8f29246df1d6
      8m	8m	3	{kubelet k8s-master-dev}					Warning	FailedSync	Error syncing pod, skipping: failed to "StartContainer" for "kafka-rest" with CrashLoopBackOff: "Back-off 40s restarting failed container=kafka-rest pod=kafka-rest_default(2cf72ef4-fa71-11e6-ba86-00163e000fbf)"
    
      7m	7m	1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Started		Started container with docker id fde96069afc0
      7m	7m	1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Created		Created container with docker id fde96069afc0; Security:[seccomp=unconfined]
      7m	6m	6	{kubelet k8s-master-dev}					Warning	FailedSync	Error syncing pod, skipping: failed to "StartContainer" for "kafka-rest" with CrashLoopBackOff: "Back-off 1m20s restarting failed container=kafka-rest pod=kafka-rest_default(2cf72ef4-fa71-11e6-ba86-00163e000fbf)"
    
      6m	6m	1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Created		Created container with docker id 60ad06a04a69; Security:[seccomp=unconfined]
      6m	6m	1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Started		Started container with docker id 60ad06a04a69
      6m	3m	12	{kubelet k8s-master-dev}					Warning	FailedSync	Error syncing pod, skipping: failed to "StartContainer" for "kafka-rest" with CrashLoopBackOff: "Back-off 2m40s restarting failed container=kafka-rest pod=kafka-rest_default(2cf72ef4-fa71-11e6-ba86-00163e000fbf)"
    
      3m	3m	1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Started		Started container with docker id 784a864de6c7
      9m	3m	6	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Pulled		Container image "confluentinc/cp-kafka-rest:3.1.1" already present on machine
      3m	3m	1	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Normal	Created		Created container with docker id 784a864de6c7; Security:[seccomp=unconfined]
      9m	1s	42	{kubelet k8s-master-dev}	spec.containers{kafka-rest}	Warning	BackOff		Back-off restarting failed docker container
      3m	1s	17	{kubelet k8s-master-dev}					Warning	FailedSync	Error syncing pod, skipping: failed to "StartContainer" for "kafka-rest" with CrashLoopBackOff: "Back-off 5m0s restarting failed container=kafka-rest pod=kafka-rest_default(2cf72ef4-fa71-11e6-ba86-00163e000fbf)"
    



```bash

```
