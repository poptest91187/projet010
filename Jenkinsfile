pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Extraire le dépôt configuré dans le projet Jenkins
                checkout scm
                echo 'Pulled branch main'
            }
        }

        stage('Build') {
            steps {
                // Exécuter la compilation avec Maven
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                // Exécuter les tests avec Maven
                sh 'mvn test'
            }
        }

        stage('Archive Artifacts') {
            steps {
                // Archiver les artefacts (fichiers .jar/.war générés)
                archiveArtifacts artifacts: '**/target/*.war', allowEmptyArchive: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished, whether successful or failed.'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
