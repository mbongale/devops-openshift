pipeline {
    agent any
	environment {
		//registry = "mbongale/devops-openshift"
		registry = "acrakspoc1.azurecr.io"
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
	    stage('Docker image creation') {
		    steps {
			    script {
				    dockerImage = docker.build registry + ":${BUILD_NUMBER}"
			    }
		    }
	    }
	    stage('IDocker mage Push') {
		    steps {
			    script {
				    docker.withRegistry('', acrCredetials ) {
					    dockerImage.push()
				    }
			    }
		    }
	    }
    }
}
