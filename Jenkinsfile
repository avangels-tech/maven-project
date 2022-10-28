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

        stage('Deploy') {
            steps {
                  sh 'echo deploy'
            }
        }
    }
}

