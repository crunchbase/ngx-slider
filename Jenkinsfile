pipeline {
    agent any

    stages {
        stage("Build and Deploy") {
            steps {
                withCredentials([usernamePassword(credentialsId: '1a6a4478-ac9f-4d54-a73d-c4d36e3a5e80', passwordVariable: 'ARTIFACTORY_PASSWORD', usernameVariable: 'ARTIFACTORY_USERNAME')]) {
                    sh "lib_builder"
                }
            }
        }
    }
}
