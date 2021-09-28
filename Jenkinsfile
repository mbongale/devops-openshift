pipeline {
    agent any
	environment {
		registry = "mbongale/devops-openshift"
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
			    dockerImage = docker.build registry + ":${BUILD_NUMBER}"
		    }
	    }
	    stage('IDocker mage Push') {
		    steps {
			    script {
				    docker.withRegistry('', registryCredentials ) {
					    dockerImage.push()
				    }
			    }
		    }
	    }
    }
}
