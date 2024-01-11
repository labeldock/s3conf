# s3conf: Docker-Friendly s3cmd Configuration

s3conf is a tool designed to quickly configure s3cmd for Amazon S3-compatible storage while performing tasks in GitLab Runner. This project simplifies and streamlines the configuration and execution of s3cmd, providing a straightforward solution.

## Introduction

Configuring and managing Amazon S3-compatible storage with s3cmd can be complex. This project was developed to assist users working in Docker environments with configuring and efficiently using s3cmd.

With s3conf, you can easily configure several key options, including:

## Key Features

- S3 configuration without interactive setup
- Configuring region and endpoint
- Specifying the endpoint for buckets
- Enabling or disabling HTTPS usage

## Usage

```
Usage: s3conf [options]
        --access-key=[ACCESS_KEY]    Access Key ID
        --secret-key=[SECRET_KEY]    Secret Access Key
        --region=[REGION]            Region
        --endpoint=[ENDPOINT]        Endpoint (Default:s3.amazonaws.com)
        --endpoint-bucket=[ENDPOINT_BUCKET]
                                     Endpoint for buckets
        --no-use-https[=IGNORE_ANY_VALUE]
                                     Use HTTP
        --use-https[=IGNORE_ANY_VALUE]
                                     Use HTTPS (Default)
```


Execute the above command to run s3conf and specify the necessary options. Access Key ID and Secret Access Key are mandatory, while the other options are optional.

![Usage of s3conf](https://raw.githubusercontent.com/labeldock/s3conf/main/contents/s3conf-example.gif)

## License

This project is distributed under the MIT License.

## Issue Reporting

If you encounter any bugs or have feature requests, please open an issue on the GitHub Issues page.

