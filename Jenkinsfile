pipeline {
    agent any

    stages {
        stage('code fork') {
            steps {
                git branch: 'master', url:' https://github.com/up1/maven_java_web_example.git', credentialsId: 'jenkins-git'
		sh 'git add -A'
		sh 'git commit -m "importing code to remote"
		withCredentials([[$class	: 'UsernamePasswordMultiBinding', credentialsId: 'jenkins-git', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD", ]]){
				  sh ('git push --set-pstream https://${USERNAME}:${PASSWORD}@github.com/mbongale/devops-openshift.git main')
				  }
		
            }
        }
    }
}
