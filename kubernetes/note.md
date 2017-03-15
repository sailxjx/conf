

```bash
# Get version and pods
kubectl version
kubectl get pods
```

    Client Version: version.Info{Major:"1", Minor:"5", GitVersion:"v1.5.1", GitCommit:"82450d03cb057bab0950214ef122b67c83fb11df", GitTreeState:"clean", BuildDate:"2016-12-22T09:28:07Z", GoVersion:"go1.7.4", Compiler:"gc", Platform:"darwin/amd64"}
    Server Version: version.Info{Major:"1", Minor:"5", GitVersion:"v1.5.2", GitCommit:"08e099554f3c31f6e6f07b448ab3ed78d0520507", GitTreeState:"clean", BuildDate:"2017-01-12T04:52:34Z", GoVersion:"go1.7.4", Compiler:"gc", Platform:"linux/amd64"}
    NAME                                READY     STATUS             RESTARTS   AGE
    autotest-accounts                   2/4       ImagePullBackOff   0          13d
    elasticsearch-3ucpd                 1/1       Running            1          212d
    freegeoip-t0ab6                     1/1       Running            1          212d
    grafana-g14fe                       1/1       Running            1          143d
    hello-world-v2z8q                   1/1       Running            1          144d
    jenkins-geix4                       1/1       Running            1          169d
    kafka-rest                          0/1       CrashLoopBackOff   1954       6d
    nginx-deployment-4087004473-192c9   1/1       Running            0          7d
    nginx-deployment-4087004473-34jkj   1/1       Running            0          7d
    nginx-deployment-4087004473-3jbb2   1/1       Running            0          7d
    nginx-deployment-4087004473-50q6v   1/1       Running            0          7d
    prometheus-523399722-zc4sg          1/1       Running            0          16d
    snapper-f936r                       3/3       Running            3          210d


# Create pods

* 外网 ip: 121.196.214.67
* 内网 ip: 10.0.0.1


```bash
echo 'apiVersion: v1
kind: Pod
metadata:
  name: kafka-rest
  labels:
    app: kafka-rest
    version: v1
spec:
  containers:
  - name: kafka-rest
    image: confluentinc/cp-kafka-rest:3.1.1
    ports:
    - containerPort: 8082
      protocol: TCP
    env:
    - name: KAFKA_REST_ZOOKEEPER_CONNECT
      value: 10.0.0.1:22181,10.0.0.1:32181,10.0.0.1:42181
    - name: KAFKA_REST_HOST_NAME
      value: 121.196.214.67
    - name: KAFKA_REST_LISTENERS
      value: http://0.0.0.0:8082
    - name: KAFKA_REST_SCHEMA_REGISTRY_URL
      value: http://10.0.0.1:38081' > kafka-rest.yml

kubectl delete pods kafka-rest
kubectl create -f kafka-rest.yml
```

    pod "kafka-rest" deleted
    pod "kafka-rest" created



```bash
kubectl get pods
```

    NAME                                READY     STATUS             RESTARTS   AGE
    autotest-accounts                   0/4       ImagePullBackOff   0          17d
    elasticsearch-3ucpd                 1/1       Running            2          215d
    freegeoip-t0ab6                     1/1       Running            2          215d
    grafana-g14fe                       1/1       Running            2          146d
    hello-world-v2z8q                   1/1       Running            2          147d
    jenkins-geix4                       1/1       Running            2          173d
    kafka-rest                          1/1       Running            6          22m
    nginx-deployment-4087004473-192c9   1/1       Running            1          10d
    nginx-deployment-4087004473-34jkj   1/1       Running            1          10d
    nginx-deployment-4087004473-3jbb2   1/1       Running            1          10d
    nginx-deployment-4087004473-50q6v   1/1       Running            1          10d
    prometheus-523399722-zc4sg          1/1       Running            1          20d
    snapper-f936r                       1/3       ImagePullBackOff   4          213d


# Create services


```bash
echo 'kind: Service
apiVersion: v1
metadata:
    labels:
        app: kafka-rest
    name: kafka-rest
    namespace: default
spec:
    clusterIP: 11.1.2.199
    ports:
    - nodePort: 30998
      port: 8082
      protocol: TCP
      targetPort: 8082
    selector:
      app: kafka-rest
    type: NodePort
status:
    loadBalancer: {}
' > kafka-rest-service.yml

kubectl apply -f kafka-rest-service.yml
```

    Error from server (NotFound): services "kafka-rest" not found
    service "kafka-rest" created



```bash
kubectl get services/kafka-rest
```

    NAME         CLUSTER-IP   EXTERNAL-IP   PORT(S)          AGE
    kafka-rest   11.1.2.199   <nodes>       8082:30998/TCP   15s



```bash
kubectl describe services/kafka-rest
```

    Name:			kafka-rest
    Namespace:		default
    Labels:			app=kafka-rest
    Selector:		app=kafka-rest
    Type:			NodePort
    IP:			11.1.2.199
    Port:			<unset>	8082/TCP
    NodePort:		<unset>	30998/TCP
    Endpoints:		10.10.1.13:8082
    Session Affinity:	None
    No events.


# Create deployments


```bash
kubectl get pods --show-labels
```

    NAME                                     READY     STATUS             RESTARTS   AGE       LABELS
    autotest-accounts                        0/4       ImagePullBackOff   0          17d       app=autotest-accounts,version=v1
    elasticsearch-3ucpd                      1/1       Running            2          215d      app=elasticsearch
    freegeoip-t0ab6                          1/1       Running            2          215d      app=freegeoip
    grafana-g14fe                            1/1       Running            2          146d      app=grafana
    hello-world-v2z8q                        1/1       Running            2          148d      app=hello-world
    jenkins-geix4                            1/1       Running            2          173d      app=jenkins
    kafka-rest                               1/1       Running            6          20h       app=kafka-rest,version=v1
    kafka-rest-deployment-3924449271-7c95b   1/1       Running            0          12s       app=kafka-rest,pod-template-hash=3924449271
    kafka-rest-deployment-3924449271-whd8l   1/1       Running            0          12s       app=kafka-rest,pod-template-hash=3924449271
    kafka-rest-deployment-3924449271-wwp0d   1/1       Running            0          12s       app=kafka-rest,pod-template-hash=3924449271
    nginx-deployment-4087004473-192c9        1/1       Running            1          11d       app=nginx,pod-template-hash=4087004473
    nginx-deployment-4087004473-34jkj        1/1       Running            1          11d       app=nginx,pod-template-hash=4087004473
    nginx-deployment-4087004473-3jbb2        1/1       Running            1          11d       app=nginx,pod-template-hash=4087004473
    nginx-deployment-4087004473-50q6v        1/1       Running            1          11d       app=nginx,pod-template-hash=4087004473
    prometheus-523399722-zc4sg               1/1       Running            1          20d       app=prometheus,pod-template-hash=523399722
    snapper-f936r                            1/3       ImagePullBackOff   4          214d      app=snapper



```bash
echo 'apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: kafka-rest-deployment
spec:
  replicas: 3
  template:
    metadata:
      labels:
        app: kafka-rest
    spec:
      containers:
      - name: kafka-rest
        image: confluentinc/cp-kafka-rest:3.2
        ports:
        - containerPort: 8082
          protocol: TCP
        env:
        - name: KAFKA_REST_ZOOKEEPER_CONNECT
          value: 10.0.0.1:22181,10.0.0.1:32181,10.0.0.1:42181
        - name: KAFKA_REST_HOST_NAME
          value: 121.196.214.67
        - name: KAFKA_REST_LISTENERS
          value: http://0.0.0.0:8082
        - name: KAFKA_REST_SCHEMA_REGISTRY_URL
          value: http://10.0.0.1:38081
' > kafka-rest-deployment.yml
kubectl apply -f kafka-rest-deployment.yml  --record
```

    deployment "kafka-rest-deployment" configured

