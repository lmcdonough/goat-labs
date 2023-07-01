# How to be a `goat`

Welcome to the `goat` tutorial where we'll cover how you can get started with the application, understand its composition, validate and test the code, and securely connect to and deploy the application via AWS. *For anyone is curious why this appcliation is named `goat`,* **unfortunately I can't tell you, for secret reasons.**

## Prerequisites

- Python3 installed
- An AWS account
- AWS Credentials
- Vault Credentials
- ***More to come since it's a work in progress***

## Setting up the Local Environment

1. **Clone the repository:** Clone the repository to your local system. Use the following command in your terminal:

   ```bash
   git clone https://github.com/lmcdonough/goat
   ```

2. **Move to the project directory:** Use the following command:

   ```bash
   cd goat
   ```

3. **Install packages:** Install the required packages with:

   ```bash
   pip install -r requirements.txt
   ```

--

## TBD

## Exploring the Application Structure

- `src`: This directory *willcontains the Terraform and Kubernetes Code
- `tests`: This folder for now contains tests for the application

## How to Run The Tests

1. **Run unit tests:** Use the following command:

   ```bash
   python test
   ```

2. **Check the coverage report:** After running the tests, you can check the coverage report here:

   ```bash
   cat coverage/lcov-report/index.html
   ```

## END TBD

--

## Setting up AWS Credentials

You need to setup AWS Credentials to connect and deploy the app.

1. **Configure AWS Credentials:** Use the `aws configure` command and follow the prompts:

   ```bash
   aws configure
   ```

   Provide your AWS Access Keys and region when prompted.

## Deploying the Application

1. **Deploy with Terraform:** Use the following command:

   ```bash
   terraform apply
   ```

### Confirm the deployment when prompted

Sweeeet... You've successfully set up, tested, and deployed the `goat` infrastructure, and Kubernetes application with `ArgoCD` deploying and managing `Deployments` and `Preview Engironments`

#### Next Steps & Further Reading

- TBD
