# docker-sshd

Main purpose of this image is to deploy SSH bastion container on AWS Fargate.

## Usage

This image loads SSH keys from specified URI and make it available as `ssh-user`.

Pass `KEYURI` environment variable to the container.
We designed this to make use of 🌏's largest pubkey repository in mind, which is named GitHub.


Testing could be done as below:

```
$ docker run -e KEYURI=https://github.com/muojp.keys -P -p1022:22 public.ecr.aws/w7f7b6i2/fargate-sshd:latest
```

Open another terminal and run:

```
$ ssh -l ssh-user -p 1022 localhost
```
Stop the container when done.

## Prebuilt image

Prebuilt image is available in Amazon ECR: https://gallery.ecr.aws/w7f7b6i2/fargate-sshd. But We encourage you to build and maintain your own image because we cannot be 100% sure that prebuilt image is free from malicious code or sorta vulnerabilities.
