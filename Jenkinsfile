pipeline {
    agent any

    stages {
        stage('code checkout') {
            steps {
                git branch: 'master', url:' https://github.com/up1/maven_java_web_example.git', credentialsId: 'jenkins-git'
		sh 'ls'
		
            }
        }
    }
}
