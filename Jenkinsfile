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

        stage('List Files') {
            steps {
                // Lister les fichiers du dépôt cloné
                sh 'ls -la'
            }
        }
    }
}
