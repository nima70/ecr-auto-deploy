# ECR Docker Push Action

This project demonstrates how to set up a GitHub Action to automatically build a Docker image from your Node.js application and push it to the Amazon Elastic Container Registry (ECR). This is particularly useful for continuous integration and deployment (CI/CD) pipelines.

## Features

- Automatically builds a Docker image upon code push to the `master` branch.
- Tags the Docker image with the latest commit SHA.
- Pushes the Docker image to Amazon ECR.
- Ensures seamless integration with AWS services.

## Prerequisites

Before you can use this GitHub Action, you will need:

1. **AWS Account**: An active AWS account with permissions to use ECR.
2. **ECR Repository**: An ECR repository where the Docker images will be stored.
3. **Node.js Application**: This action assumes you have a Node.js application with a `Dockerfile`.

## Setting Up GitHub Secrets

To securely manage your AWS credentials and other sensitive information, you need to set up GitHub Secrets for your repository:

1. Go to your repository on GitHub.
2. Click on `Settings` > `Secrets` and variables > `Actions`.
3. Click `New repository secret` to add the following secrets:

### Required Secrets

| Secret Name              | Description |
|--------------------------|-------------|
| `AWS_ACCESS_KEY_ID`       | Your AWS Access Key ID. |
| `AWS_SECRET_ACCESS_KEY`   | Your AWS Secret Access Key. |
| `AWS_REGION`              | The AWS region where your ECR is located (e.g., `us-west-2`). |
| `AWS_ACCOUNT_ID`          | Your AWS Account ID (this is used to tag and push the Docker image). |
| `ECR_REPOSITORY_NAME`     | The name of your ECR repository. |
| `IMAGE_TAG`               | The tag you want to use for the Docker image (e.g., `latest`). |

### Example of Adding a Secret

To add the `AWS_ACCESS_KEY_ID` secret:

1. Click `New repository secret`.
2. In the `Name` field, enter `AWS_ACCESS_KEY_ID`.
3. In the `Value` field, enter your AWS Access Key ID.
4. Click `Add secret`.

Repeat these steps for each of the required secrets listed above.

## How It Works

This GitHub Action is triggered every time code is pushed to the `master` branch. The action follows these steps:

1. **Checkout Code**: The action checks out the latest code from the repository.
2. **Set up Node.js**: The specified Node.js version is installed.
3. **Install Dependencies**: The Node.js application dependencies are installed using `npm install`.
4. **Build the App**: The application is built using `npm run build`.
5. **Configure AWS Credentials**: The action configures AWS credentials using the secrets you provided.
6. **Log in to Amazon ECR**: The action logs into the ECR using the AWS credentials.
7. **Build, Tag, and Push Docker Image**: The Docker image is built, tagged with the specified image tag and the latest commit SHA, and pushed to the ECR.
8. **Log out from Docker Hub**: The action logs out from Docker to clean up.

## Usage

To use this GitHub Action in your project, ensure your repository includes a `Dockerfile` and the necessary `npm` scripts. Then, commit and push your code to the `master` branch. The GitHub Action will automatically trigger and push your Docker image to the specified ECR repository.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with any improvements or new features.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
