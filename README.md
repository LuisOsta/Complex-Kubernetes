1. Utilized PostgreSQL database to store user and application database
2. Implemented caching layer with Redis in-memory cache locally & AWS Elastic Cache In Production.
3. Dockerized system services to maximize portability and ease development and deployment.
4. Leveraged NGINX to serve as a request router & production server for SPA & the microservices apis utilized
5. Built CI/CD Pipeline using Travis CI & AWS
6. Leveraged AWS Eslatic Beanstalk to deploy and host a multi-container system

Important commands

```
kubectl create secret generic <secret_name> --from-literal KEY_NAME=value
```
