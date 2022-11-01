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
                   def myImage = docker.build ("maven:3.2")
                   def myImage1 = docker.build ("maven:latest")
                   def myImage2 = docker.build ("maven:build4")
                   myImage.push('3.2')
                   myImage1.push('latest')
                   myImage2.push('build4')
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

