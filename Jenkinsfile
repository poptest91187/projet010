pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Spécifier directement l'URL du dépôt Git
                //git url: 'https://github.com/poptest91187/projet010.git', branch: 'main'
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
    

    post {
        always {
            // Afficher le résultat de l'exécution, même en cas d'échec
            junit '**/target/surefire-reports/*.xml'
        }
    }

 stage('Test2') {
            steps {
                // Exécuter les tests avec Maven
                sh 'tree'
            }
        }



    }
}
