# ocp-functional-tests
Usage: ./run_all.sh <deploy|verify|clean>

## deploy
 ```./run_all.sh deploy
[INFO] ========== Starting [deploy] tests at 20250509_225338 ==========
[INFO] ========== Running [deploy] for Test: Fct_Sys_001_NodeTaintCheck ==========
[WARN] [SKIP] No executable /home/jim/jim/test/ocp-functional-tests/Fct_Sys_001_NodeTaintCheck/deploy.sh found
[INFO] ========== Finished [deploy] for Test: Fct_Sys_001_NodeTaintCheck ==========

[INFO] ========== Running [deploy] for Test: Fct_Sys_002_DefaultTemplate ==========
[INFO] [deploy] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_002_DefaultTemplate/deploy.sh
[INFO] [deploy] Fct_Sys_002_DefaultTemplate completed successfully
[INFO] ========== Finished [deploy] for Test: Fct_Sys_002_DefaultTemplate ==========

[INFO] ========== Running [deploy] for Test: Fct_Sys_004_AppDeploy ==========
[INFO] [deploy] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_004_AppDeploy/deploy.sh
[INFO] Creating project: test
[INFO] Deploying application using OpenShift httpd image
[INFO] Creating edge route for the httpd service
route.route.openshift.io/httpd-24-rhel7 created
[INFO] [deploy] Fct_Sys_004_AppDeploy completed successfully
[INFO] ========== Finished [deploy] for Test: Fct_Sys_004_AppDeploy ==========

[INFO] ========== Running [deploy] for Test: Fct_Sys_005_Pod_Affinity ==========
[INFO] [deploy] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_005_Pod_Affinity/deploy.sh
[INFO] Creating project: affinity-test
[INFO] Deploying httpd application with podAntiAffinity
deploymentconfig.apps.openshift.io/affinity-test created
[INFO] [deploy] Fct_Sys_005_Pod_Affinity completed successfully
[INFO] ========== Finished [deploy] for Test: Fct_Sys_005_Pod_Affinity ==========

[INFO] ========== Running [deploy] for Test: Fct_Sys_007_Image_Registry ==========
[INFO] [deploy] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_007_Image_Registry/deploy.sh
[INFO] Importing image 'rhel7-minimal' from 'registry.access.redhat.com/rhel7-minimal' into project 'openshift'...
imagestream.image.openshift.io/rhel7-minimal imported

Name:			rhel7-minimal
Namespace:		openshift
Created:		Less than a second ago
Labels:			<none>
Annotations:		openshift.io/image.dockerRepositoryCheck=2025-05-09T14:53:47Z
Image Repository:	default-route-openshift-image-registry.apps.aacadi1.oasis.example.com/openshift/rhel7-minimal
Image Lookup:		local=false
Unique Images:		1
Tags:			1

latest
  tagged from registry.access.redhat.com/rhel7-minimal

  * registry.access.redhat.com/rhel7-minimal@sha256:54842cba95a036f81dd1da594aa664a8b404c27913ec59cdcf200a63eda10899
      Less than a second ago

Image Name:	rhel7-minimal:latest
Docker Image:	registry.access.redhat.com/rhel7-minimal@sha256:54842cba95a036f81dd1da594aa664a8b404c27913ec59cdcf200a63eda10899
Name:		sha256:54842cba95a036f81dd1da594aa664a8b404c27913ec59cdcf200a63eda10899
Created:	Less than a second ago
Annotations:	image.openshift.io/dockerLayersOrder=ascending
Image Size:	34.36MB in 1 layers
Layers:		34.36MB	sha256:ed513fc73a69d0957564facd66f9b589ee3415c3d3840fc3a74c0fa359d3ffe2
Image Created:	11 months ago
Author:		<none>
Arch:		amd64
Command:	/bin/bash
Working Dir:	<none>
User:		<none>
Exposes Ports:	<none>
Docker Labels:	architecture=x86_64
		build-date=2024-05-29T03:08:41
		com.redhat.component=rhel7-atomic-container
		com.redhat.license_terms=https://www.redhat.com/licenses/eulas
		description=The Red Hat Enterprise Linux Base image is designed to be a minimal, fully supported base image where several of the traditional operating system components such as python an systemd have been removed. The Atomic Image also includes a simple package manager called microdnf which can add/update packages as needed.
		distribution-scope=public
		io.buildah.version=1.29.0
		io.k8s.description=The Red Hat Enterprise Linux Base image is designed to be a minimal, fully supported base image where several of the traditional operating system components such as python an systemd have been removed. The Atomic Image also includes a simple package manager called microdnf which can add/update packages as needed.
		io.k8s.display-name=Red Hat Enterprise Linux 7
		io.openshift.tags=minimal rhel7
		maintainer=Red Hat, Inc.
		name=rhel7-atomic
		release=1428
		summary=Provides the latest release of Red Hat Enterprise Linux 7 in a minimal, fully supported base image where several of the traditional operating system components such as python an systemd have been removed.
		url=https://access.redhat.com/containers/#/registry.access.redhat.com/rhel7-atomic/images/7.9-1428
		vcs-ref=9458c9de09a5c5395628921aa56237946749b433
		vcs-type=git
		vendor=Red Hat, Inc.
		version=7.9
Environment:	PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
		container=oci


[INFO] Image import initiated.
[INFO] [deploy] Fct_Sys_007_Image_Registry completed successfully
[INFO] ========== Finished [deploy] for Test: Fct_Sys_007_Image_Registry ==========

[INFO] ========== Running [deploy] for Test: Fct_Sys_011_NFS_PV ==========
[INFO] [deploy] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_011_NFS_PV/deploy.sh
[INFO] Creating project: test (ignore if exists)
[INFO] Creating PersistentVolume: pv0001
persistentvolume/pv0001 created
[INFO] Creating PersistentVolumeClaim: pvc0001 in project test
persistentvolumeclaim/pvc0001 created
[INFO] [deploy] Fct_Sys_011_NFS_PV completed successfully
[INFO] ========== Finished [deploy] for Test: Fct_Sys_011_NFS_PV ==========

[INFO] ========== Running [deploy] for Test: Fct_Sys_013_HPA ==========
[INFO] [deploy] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_013_HPA/deploy.sh
limitrange/limits created
--> Found container image 4047254 (6 years old) from quay.io for "quay.io/gpte-devops-automation/pod-autoscale-lab:rc0"

    * An image stream tag will be created as "pod-autoscale:rc0" that will track this image

--> Creating resources ...
    imagestream.image.openshift.io "pod-autoscale" created
    deployment.apps "pod-autoscale" created
    service "pod-autoscale" created
--> Success
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose service/pod-autoscale'
    Run 'oc status' to view your app.
route.route.openshift.io/pod-autoscale created
limitrange "cpu-mem-limit-bound" deleted
horizontalpodautoscaler.autoscaling/pod-autoscale autoscaled
[INFO] [deploy] Fct_Sys_013_HPA completed successfully
[INFO] ========== Finished [deploy] for Test: Fct_Sys_013_HPA ==========

[INFO] ========== Running [deploy] for Test: Nft_Sec_Network-Policy ==========
[INFO] [deploy] Executing /home/jim/jim/test/ocp-functional-tests/Nft_Sec_Network-Policy/deploy.sh
Now using project "network-policy-1" on server "https://api.aacadi1.oasis.example.com:6443".

You can add applications to this project with the 'new-app' command. For example, try:

    oc new-app rails-postgresql-example

to build a new example application in Ruby. Or use kubectl to deploy a simple Kubernetes application:

    kubectl create deployment hello-node --image=k8s.gcr.io/e2e-test-images/agnhost:2.33 -- /agnhost serve-hostname

Now using project "network-policy-2" on server "https://api.aacadi1.oasis.example.com:6443".

You can add applications to this project with the 'new-app' command. For example, try:

    oc new-app rails-postgresql-example

to build a new example application in Ruby. Or use kubectl to deploy a simple Kubernetes application:

    kubectl create deployment hello-node --image=k8s.gcr.io/e2e-test-images/agnhost:2.33 -- /agnhost serve-hostname

deploymentconfig.apps.openshift.io/httpd created
service/httpd created
deploymentconfig.apps.openshift.io/network-policy-test created
service/network-policy-test created
[INFO] [deploy] Nft_Sec_Network-Policy completed successfully
[INFO] ========== Finished [deploy] for Test: Nft_Sec_Network-Policy ==========

[INFO] ========== All [deploy] tests completed. Logs saved to /home/jim/jim/test/ocp-functional-tests/logs/deploy_20250509_225338.log ==========
```
## verify 

```
 ./run_all.sh verify
[INFO] ========== Starting [verify] tests at 20250509_225541 ==========
[INFO] ========== Running [verify] for Test: Fct_Sys_001_NodeTaintCheck ==========
[INFO] [verify] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_001_NodeTaintCheck/verify.sh
[INFO] Checking taints for node: aacadiinfra1
[INFO] [
  {
    "effect": "NoExecute",
    "key": "infra",
    "value": "reserved"
  },
  {
    "effect": "NoSchedule",
    "key": "infra",
    "value": "reserved"
  }
]
[PASS] aacadiinfra1: Node taints are correctly configured.
[INFO] Checking taints for node: aacadiinfra2
[INFO] [
  {
    "effect": "NoExecute",
    "key": "infra",
    "value": "reserved"
  },
  {
    "effect": "NoSchedule",
    "key": "infra",
    "value": "reserved"
  }
]
[PASS] aacadiinfra2: Node taints are correctly configured.
[INFO] Checking taints for node: aacadiinfra3
[INFO] [
  {
    "effect": "NoExecute",
    "key": "infra",
    "value": "reserved"
  },
  {
    "effect": "NoSchedule",
    "key": "infra",
    "value": "reserved"
  }
]
[PASS] aacadiinfra3: Node taints are correctly configured.
[PASS] All nodes have correct taints.
[INFO] [verify] Fct_Sys_001_NodeTaintCheck completed successfully
[INFO] ========== Finished [verify] for Test: Fct_Sys_001_NodeTaintCheck ==========

[INFO] ========== Running [verify] for Test: Fct_Sys_002_DefaultTemplate ==========
[INFO] [verify] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_002_DefaultTemplate/verify.sh
[PASS] Default project template 'project-request' exists in openshift-config.
[PASS] Found required NetworkPolicy: allow-from-openshift-ingress
[PASS] Found required NetworkPolicy: allow-from-openshift-monitoring
[PASS] Found required NetworkPolicy: allow-same-namespace
[PASS] All required NetworkPolicies are present in project 'template-test'.
[INFO] [verify] Fct_Sys_002_DefaultTemplate completed successfully
[INFO] ========== Finished [verify] for Test: Fct_Sys_002_DefaultTemplate ==========

[INFO] ========== Running [verify] for Test: Fct_Sys_004_AppDeploy ==========
[INFO] [verify] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_004_AppDeploy/verify.sh
[INFO] Waiting for route to be created...
[INFO] Route found: httpd-24-rhel7-test.apps.aacadi1.oasis.example.com
[INFO] Verifying route with curl...
[PASS] Application is deployed and accessible via route.
[INFO] [verify] Fct_Sys_004_AppDeploy completed successfully
[INFO] ========== Finished [verify] for Test: Fct_Sys_004_AppDeploy ==========

[INFO] ========== Running [verify] for Test: Fct_Sys_005_Pod_Affinity ==========
[INFO] [verify] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_005_Pod_Affinity/verify.sh
[INFO] Verifying pods distribution for project: affinity-test
[INFO] Pods and their assigned nodes:
affinity-test-1-5jlf8	aacadiworker2	cr222
affinity-test-1-drrth	aacadiworker2	cr222
affinity-test-1-mxnd9	aacadiworker3	cr225
affinity-test-1-tn4gp	aacadiworker1	cr225
[PASS] Pods are distributed across at least two zones
[INFO] [verify] Fct_Sys_005_Pod_Affinity completed successfully
[INFO] ========== Finished [verify] for Test: Fct_Sys_005_Pod_Affinity ==========

[INFO] ========== Running [verify] for Test: Fct_Sys_007_Image_Registry ==========
[INFO] [verify] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_007_Image_Registry/verify.sh
[INFO] Verifying ImageStream 'rhel7-minimal' in project 'openshift'...
[PASS] ImageStream 'rhel7-minimal' found.
[INFO] [verify] Fct_Sys_007_Image_Registry completed successfully
[INFO] ========== Finished [verify] for Test: Fct_Sys_007_Image_Registry ==========

[INFO] ========== Running [verify] for Test: Fct_Sys_011_NFS_PV ==========
[INFO] [verify] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_011_NFS_PV/verify.sh
[INFO] Verifying PV: pv0001
NAME     CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM          STORAGECLASS   REASON   AGE
pv0001   5Gi        RWX            Retain           Bound    test/pvc0001                           117s
[INFO] Verifying PVC: pvc0001 in namespace test
NAME      STATUS   VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
pvc0001   Bound    pv0001   5Gi        RWX                           117s
[PASS] NFS PV Verification passed
[INFO] [verify] Fct_Sys_011_NFS_PV completed successfully
[INFO] ========== Finished [verify] for Test: Fct_Sys_011_NFS_PV ==========

[INFO] ========== Running [verify] for Test: Fct_Sys_013_HPA ==========
[INFO] [verify] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_013_HPA/verify.sh
[INFO] Sending load with ApacheBench...
This is ApacheBench, Version 2.3 <$Revision: 1843412 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking pod-autoscale-my-hpa.apps.aacadi1.oasis.example.com (be patient)
Completed 10000 requests
Completed 20000 requests
Completed 30000 requests
Completed 40000 requests
Completed 50000 requests
Completed 60000 requests
Completed 70000 requests
Completed 80000 requests
Completed 90000 requests
Completed 100000 requests
Finished 100000 requests


Server Software:
Server Hostname:        pod-autoscale-my-hpa.apps.aacadi1.oasis.example.com
Server Port:            443
SSL/TLS Protocol:       TLSv1.2,ECDHE-RSA-AES128-GCM-SHA256,2048,128
Server Temp Key:        X25519 253 bits
TLS Server Name:        pod-autoscale-my-hpa.apps.aacadi1.oasis.example.com

Document Path:          /
Document Length:        88 bytes

Concurrency Level:      1000
Time taken for tests:   111.287 seconds
Complete requests:      100000
Failed requests:        21539
   (Connect: 0, Receive: 0, Length: 21539, Exceptions: 0)
Total transferred:      30667355 bytes
HTML transferred:       8767355 bytes
Requests per second:    898.58 [#/sec] (mean)
Time per request:       1112.865 [ms] (mean)
Time per request:       1.113 [ms] (mean, across all concurrent requests)
Transfer rate:          269.11 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        7  309 442.8    179    7454
Processing:     5  794 1200.3    296   13355
Waiting:        4  721 1191.3    220   13331
Total:         84 1102 1204.2    600   13494

Percentage of the requests served within a certain time (ms)
  50%    600
  66%    922
  75%   1388
  80%   1493
  90%   2253
  95%   3599
  98%   5359
  99%   6061
 100%  13494 (longest request)
[INFO] Waiting for HPA scale up...
[INFO] Checking HPA status:
NAME            REFERENCE                  TARGETS    MINPODS   MAXPODS   REPLICAS   AGE
pod-autoscale   Deployment/pod-autoscale   100%/80%   1         5         2          8m16s
[PASS] HPA scaled to 2 replicas
[INFO] [verify] Fct_Sys_013_HPA completed successfully
[INFO] ========== Finished [verify] for Test: Fct_Sys_013_HPA ==========

[INFO] ========== Running [verify] for Test: Nft_Sec_Network-Policy ==========
[INFO] [verify] Executing /home/jim/jim/test/ocp-functional-tests/Nft_Sec_Network-Policy/verify.sh
[INFO] Verifying intra-project communication success...
Already on project "network-policy-2" on server "https://api.aacadi1.oasis.example.com:6443".
[INFO] Accessing same-project service...
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>Test Page for the Apache HTTP Server on Red Hat Enterprise Linux</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<style type="text/css">
			/*<![CDATA[*/
			body {
				background-color: #fff;
[INFO] Accessing cross-project service, should fail...
curl: (28) Connection timed out after 5001 milliseconds
command terminated with exit code 28
[PASS] Cross-project traffic correctly denied
[INFO] Creating NetworkPolicy to allow traffic from network-policy-2
networkpolicy.networking.k8s.io/allow-from-network-policy-2 created
[INFO] Label namespace network-policy-2 for NetworkPolicy selector
namespace/network-policy-2 labeled
[INFO] Accessing cross-project service again, should succeed now...
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>Test Page for the Apache HTTP Server on Red Hat Enterprise Linux</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<style type="text/css">
			/*<![CDATA[*/
			body {
				background-color: #fff;
[PASS] Cross-project traffic succeeded after applying NetworkPolicy
[INFO] [verify] Nft_Sec_Network-Policy completed successfully
[INFO] ========== Finished [verify] for Test: Nft_Sec_Network-Policy ==========

[INFO] ========== All [verify] tests completed. Logs saved to /home/jim/jim/test/ocp-functional-tests/logs/verify_20250509_225541.log ==========
```

## clean
```
./run_all.sh clean
[INFO] ========== Starting [clean] tests at 20250509_225226 ==========
[INFO] ========== Running [clean] for Test: Fct_Sys_001_NodeTaintCheck ==========
[WARN] [SKIP] No executable /home/jim/jim/test/ocp-functional-tests/Fct_Sys_001_NodeTaintCheck/clean.sh found
[INFO] ========== Finished [clean] for Test: Fct_Sys_001_NodeTaintCheck ==========

[INFO] ========== Running [clean] for Test: Fct_Sys_002_DefaultTemplate ==========
[INFO] [clean] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_002_DefaultTemplate/clean.sh
[INFO] Deleting project template-test
project.project.openshift.io "template-test" deleted
[INFO] [clean] Fct_Sys_002_DefaultTemplate completed successfully
[INFO] ========== Finished [clean] for Test: Fct_Sys_002_DefaultTemplate ==========

[INFO] ========== Running [clean] for Test: Fct_Sys_004_AppDeploy ==========
[INFO] [clean] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_004_AppDeploy/clean.sh
[INFO] Deleting project test
project.project.openshift.io "test" deleted
[INFO] [clean] Fct_Sys_004_AppDeploy completed successfully
[INFO] ========== Finished [clean] for Test: Fct_Sys_004_AppDeploy ==========

[INFO] ========== Running [clean] for Test: Fct_Sys_005_Pod_Affinity ==========
[INFO] [clean] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_005_Pod_Affinity/clean.sh
[INFO] Deleting project affinity-test
project.project.openshift.io "affinity-test" deleted
[INFO] [clean] Fct_Sys_005_Pod_Affinity completed successfully
[INFO] ========== Finished [clean] for Test: Fct_Sys_005_Pod_Affinity ==========

[INFO] ========== Running [clean] for Test: Fct_Sys_007_Image_Registry ==========
[INFO] [clean] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_007_Image_Registry/clean.sh
[INFO] Deleting ImageStream 'rhel7-minimal' from project 'openshift'...
imagestream.image.openshift.io "rhel7-minimal" deleted
[INFO] Cleanup complete.
[INFO] [clean] Fct_Sys_007_Image_Registry completed successfully
[INFO] ========== Finished [clean] for Test: Fct_Sys_007_Image_Registry ==========

[INFO] ========== Running [clean] for Test: Fct_Sys_011_NFS_PV ==========
[INFO] [clean] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_011_NFS_PV/clean.sh
[INFO] Deleting PVC: pvc0001 in project test
persistentvolumeclaim "pvc0001" deleted
[INFO] Deleting PV: pv0001
persistentvolume "pv0001" deleted
[INFO] Deleting project: test
project.project.openshift.io "test" deleted
[INFO] [clean] Fct_Sys_011_NFS_PV completed successfully
[INFO] ========== Finished [clean] for Test: Fct_Sys_011_NFS_PV ==========

[INFO] ========== Running [clean] for Test: Fct_Sys_013_HPA ==========
[INFO] [clean] Executing /home/jim/jim/test/ocp-functional-tests/Fct_Sys_013_HPA/clean.sh
project.project.openshift.io "my-hpa" deleted
[INFO] [clean] Fct_Sys_013_HPA completed successfully
[INFO] ========== Finished [clean] for Test: Fct_Sys_013_HPA ==========

[INFO] ========== Running [clean] for Test: Nft_Sec_Network-Policy ==========
[INFO] [clean] Executing /home/jim/jim/test/ocp-functional-tests/Nft_Sec_Network-Policy/clean.sh
project.project.openshift.io "network-policy-1" deleted
project.project.openshift.io "network-policy-2" deleted
[INFO] [clean] Nft_Sec_Network-Policy completed successfully
[INFO] ========== Finished [clean] for Test: Nft_Sec_Network-Policy ==========

[INFO] ========== All [clean] tests completed. Logs saved to /home/jim/jim/test/ocp-functional-tests/logs/clean_20250509_225226.log ==========
```


