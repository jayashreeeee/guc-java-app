pipeline {

    agent any

    environment {
        VM_IP = "135.235.218.234"
        VM_USER = "azureuser"
        APP_PATH = "/opt/tomcat/webapps"
    }


    stages {


        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/<your-user>/guc-java-app.git'
            }
        }


        stage('Build') {
            steps {
                sh '''
                cd guc-backend
                mvn clean package -DskipTests
                '''
            }
        }


        stage('Test') {
            steps {
                sh '''
                cd guc-backend
                mvn test
                '''
            }
        }


        stage('Archive') {
            steps {
                archiveArtifacts artifacts:
                'guc-backend/target/*.war',
                fingerprint: true
            }
        }


        stage('Deploy') {
            steps {

                sshagent(['azure-vm-key']) {

                    sh '''
                    scp -o StrictHostKeyChecking=no \
                    guc-backend/target/*.war \
                    azureuser@$VM_IP:/tmp/app.war


                    ssh -o StrictHostKeyChecking=no \
                    azureuser@$VM_IP "
                    
                    sudo rm -rf /opt/tomcat/webapps/guc-backend*
                    
                    sudo cp /tmp/app.war \
                    /opt/tomcat/webapps/guc-backend.war
                    
                    sudo systemctl restart tomcat
                    
                    "
                    '''
                }
            }
        }


        stage('Health Check') {

            steps {

                sh '''
                sleep 20

                curl -f \
                http://$VM_IP:8080/guc-backend/
                '''
            }
        }

    }


    post {

        success {
            echo "CI/CD Pipeline Completed Successfully"
        }

        failure {
            echo "Pipeline Failed"
        }
    }
}
