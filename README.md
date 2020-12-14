# Machine Translation EN-DE
Algorithmic translation of text from one language to another is called Machine Translation (MT).
In this repo we have a simple MT service that translates English text to German.

# Setup on Mac
Note that you might have to use different commands on a different system. 

## Prerequisites

- `wget`
- `unzip`
- Docker
- Kubernetes

## 1. Download the Model
This service requires a machine learning model to work. You have to download the models from [here](https://drive.google.com/file/d/1HZY0LNzSSlhbBUk-K71re6lkRId5bNyw/view?usp=sharing).
Alternatively, you can download the model using the following scripts.  

```shell script
# Download the zip file
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1HZY0LNzSSlhbBUk-K71re6lkRId5bNyw' -O model.zip

# Unzip the model files
unzip model.zip
```

## 2. Docker Build and Run
Now you have to build the docker image and run a it with the downloaded model

```shell script


cd <project root>

# Build the image
docker build -t ns-nmt:latest .

# Run a docker container to serve the translation model
docker run --rm -v ${PWD}/model:/model -e NS_NMT_MODEL_DIR=/model -p 8000:8000 ns-nmt poetry run uvicorn main:app --host 0.0.0.0 --port 8000
```

## 3. Try API in Your Browser

Go to [localhost:8000/docs](localhost:8000/docs) 


# Task
Your task is to develop a CI/CD pipeline and deploy this service on a K8 cluster.
The following are subtasks/questions:

1. **CI/CD Pipeline**:
   You have to create a CI/CD pipeline to deploy this service on a K8 cluster.
   You can use any automation tool, e.g., CircleCI, AzurePipelines, Github Actions, etc. to do so.
   You do everything with a free Azure/AWS account. We recommend using Azure.  

2. Share the API URL with us

3. How can you scale this service to handle 2000 Calls per second

4. What tools would you use to monitor the service, and log API usage?

5. What strategy did you use to make the model files accessible to all services?

6. What will be your strategy for AB testing, given a new model? 

7. **[BONUS]** What will be your strategy to setup a staging and dev environment?

# How to Submit your Solution
- Fork/copy this repo
- Add your CI pipeline
- Write answers to the above question in the Readme
- Share the repo link with us and add `dashayushman` as a contributor
- Make sure to keep the solution repo private

# Good Luck!