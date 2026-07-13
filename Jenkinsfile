pipeline {

    agent any

    environment {
        VM_IP   = "135.235.218.234"
        VM_USER = "azureuser"
    }

    stages {

        stage('Build') {
            steps {
                dir('guc-backend/guc-backend') {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Test') {
            steps {
                dir('guc-backend/guc-backend') {
                    sh 'mvn test'
                }
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'guc-backend/guc-backend/target/*.war', fingerprint: true
            }
        }

        stage('Deploy') {
            steps {
                sshagent(credentials: ['azure-vm-key']) {

                    sh """
                    scp -o StrictHostKeyChecking=no \
                    guc-backend/guc-backend/target/*.war \
                    ${VM_USER}@${VM_IP}:/tmp/guc-backend.war

                    ssh -o StrictHostKeyChecking=no ${VM_USER}@${VM_IP} '
                    sudo rm -rf /opt/tomcat/webapps/guc-backend*
                    sudo cp /tmp/guc-backend.war /opt/tomcat/webapps/guc-backend.war
                    sudo systemctl restart tomcat
                    '
                    """
                }
            }
        }

        stage('Health Check') {
            steps {
                sh """
                sleep 20
                curl -f http://${VM_IP}:8080/guc-backend/
                """
            }
        }
    }

    post {

        success {
            echo 'CI/CD Pipeline Completed Successfully'
        }

        failure {
            echo 'Pipeline Failed'
        }

        always {
            cleanWs()
        }
    }
}
