pipeline {
    agent any

    stages {
        stage('code fork') {
            steps {
                git branch: 'master', url:' https://github.com/up1/maven_java_web_example.git', credentialsId: 'jenkins-git'
		sh 'ls'
		sh "git remote set-url origin 'https://github.com/mbongale/devops-openshift.git'"
		sh 'git add .'
		sh 'git status'
		sh "git commit -m 'importing code to remote'"
		withCredentials([[$class	: 'UsernamePasswordMultiBinding', credentialsId: 'jenkins-git', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD', ]]){
				  sh ('git push --set-upstream https://${USERNAME}:${PASSWORD}@github.com/mbongale/devops-openshift.git main')
				  }
		
            }
        }
    }
}
