# Debian Image Configured With AWSCli
A Dockerfile that configures a Debian image configured ith AWSCli. 


## Techonologies
* [Docker](https://www.docker.com)
* [AWSCli](https://aws.amazon.com/en/cli/)


## Requirements
* [Docker](https://www.docker.com)
* [AWS Access Key Id](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
* [AWS Secret Key](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)


## Usage

Get your AWS Access Key Id and Secret Key from from the IAM console, or ask your account admin. Next insert the values in `config/credentials` file.
```bash
[default]
aws_access_key_id=
aws_secret_access_key=
```

Insert the AWS region Id in `config/config`.
```bash
[default]
region=
output=json
```

Start the `setup.sh` script.
```bash
source setup.sh
```

`setup.sh` builds the image, containers, and attaches your terminal to the containers's `/bin/bash`.

---------------------------
> "Sertão: é dentro da gente." (Guimarães Rosa)
