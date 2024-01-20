pipeline{
    environment{
        WINDOWS_INSTANCE_IP = ''
        SSH_CREDENTIALS_ID = ''
    }
    agents any

    stages{
        stage('Start'){
            steps{
                sh 'mvn --version'
            }
        }
        stage('Code Check'){
            steps{
                sh 'commands'
            }
        }
        stage(){
            steps{
                script{
                    withCredentials([
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: AWS_CREDENTIALS_ID,
                        accessKeyVariable: ''
                        secretKeyVariable: ''
                    ])
                }
            }
        }   
    }
}