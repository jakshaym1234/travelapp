- Setup the following secrets for secret as env variables when running the bootstrap script

-   1. DOCKER_USERNAME - to push/pull image to docker hub
-   2. DOCKER_PASSWORD - to push/pull image to docker hub

  ![image](https://user-images.githubusercontent.com/55613494/126874803-4a537969-6894-43ac-95e4-5d1d65b0414d.png)
--------------------------------------------------------------------------
-- bootstrap.sh steps:-

- Docker login
- Build JAVA image using Dockerfile in java-app folder
- Push to DOCKER HUB
- Remove local copy
- Build GOLANG image using Dockerfile in golang-app folder
- Push to DOCKER HUB
- Remove local copy
- kubectl apply JAVA Deployment, Service
- kubectl apply GOLANG Deployment, Service
- kubectl apply INGRESS and CANARY INGRESS for JAVA Service with 30% weight

--------------------------------------------------------------------------
- Prereq:
-   minikube with nginx ingress controller installed

--------------------------------------------------------------------------
Validation:
- JAVA and GOLANG APP service available with LB
![image](https://user-images.githubusercontent.com/55613494/126874858-7e00f3da-1c0d-4d90-9c95-1f61421523da.png)
![image](https://user-images.githubusercontent.com/55613494/126874882-85a985f1-c5b3-4da5-9827-17f6bf44fe9c.png)

![image](https://user-images.githubusercontent.com/55613494/126874871-50074d53-7831-476a-883f-f40e63421cb5.png)

--------------------------------------------------------------------------
- Ingress:

![image](https://user-images.githubusercontent.com/55613494/126874913-b1446690-2338-44ab-a6e9-1980951db431.png)

--------------------------------------------------------------------------