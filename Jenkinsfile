pipeline {

    agent any
    
    environment {
        DOCKER_HUB_PASS = credentials('docker_hub_passwd')
    }    
    
    stages {

        stage('Build') {
            steps {
                sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh

                '''
            }
         
        post {
               success {
                   archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
               }
           }    
            
        }
        stage('Test') {
            steps {
                 sh 'echo test'
                 sh './jenkins/test/mvn.sh mvn test'
            }

        }

        stage('Push') {
            steps {
                 sh 'echo push'
                 sh './jenkins/push/push.sh'
            }
        }
        
         stage('ECR push') {
            steps {
               script {
                   docker.withRegistry('https://971691552202.dkr.ecr.ap-south-1.amazonaws.com', 
                   'ecr:ap-south-1:aws-ecr-user') {
                   def myImage = docker.build ('maven:NEW_BUILD_TAG')
                   myImage.push('NEW_BUILD_TAG')
                   myImage.push('latest')
                  }
               }
             }
         }

        stage('Deploy') {
            steps {
                  sh 'echo deploy'
            }
        }
    }
}

