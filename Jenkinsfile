pipeline {
    agent any
    
    stages{
        stage("Code Clone"){
            steps{
                echo "Cloning code from Github"
                git url:"https://github.com/NIS9860/django-todo-cicd.git", branch:"develop"
                
            }
            
        }
        
        stage("Code Build"){
            steps{
                echo "Building the coe with docker."
                sh "docker build -t web-app-todo ."
                
            }
            
        }
        
        stage("Code Push"){
            steps{
                echo "Pushing the image to Dockerhub."
                withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerhubPass",usernameVariable:"dockerhubUser")]){
                sh "docker tag web-app-todo ${env.dockerhubUser}/web-app-todo:latest"
                sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPass}"
                sh "docker push ${env.dockerhubUser}/web-app-todo:latest"
                }
              
            }
            
        }
        
        stage("Code Deploy"){
            steps{
                echo "Deploying the container."
                sh "docker-compose down && docker-compose up -d"
                
            }
            
        }
    }
}
