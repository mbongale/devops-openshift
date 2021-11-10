pipeline {
    agent any
	environment {
		registry = "mbongale/devops-openshift"
		acr_registry = "acrakspoc1.azurecr.io"
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
				    sh "docker login  ${env.acr_registry} --username acrakspoc1 --password YI4fNS=VgBzd4LXnuTxtMMkeO3ICGDpx"
				    sh "docker push $dockerImage"
			    }
		    }
	    }
	   /* stage('Docker mage Push') {
		    steps {
			    script {
				    docker.withRegistry(acr_registry, acrCredetials ) {
					    dockerImage.push()
				    }
				    sh "docker login  ${env.acr_registry} --username acrakspoc1 --password YI4fNS=VgBzd4LXnuTxtMMkeO3ICGDpx"
				    sh "docker push ${env.dockerImage}"
			    }
		    }
	    } */
    }
}
