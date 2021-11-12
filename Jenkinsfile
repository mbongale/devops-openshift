pipeline {
    agent any
	environment {
		registry = "devops-openshift"
		acr_registry = "acrakspoc1.azurecr.io/acrakspoc1"
		acrCredetials = "azure-acr-login"
		dockerImage = ''
		registryCredentials = "docker-cred"
	}

    stages {
        stage('Code Build') {
            steps {
		sh "mvn clean package"
	    		
            }
        }
	    stage('Docker image creation and push') {
		    steps {
			    script {
				    dockerImage = docker.build acr_registry + ":${BUILD_NUMBER}"
				    withCredentials([usernamePassword(credentialsId: 'acrCredetials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
				    	sh "docker login  ${env.acr_registry} --username $USERNAME --password $PASSWORD"
				    }
				     sh "docker push acrakspoc1.azurecr.io/acrakspoc1:${BUILD_NUMBER}"
			    }
		    }
	    }
    }
}
