pipeline 
{
    agent
    {
       label 'mypoc'
    }
    
    environment
    {
        imageName = "acrakspoc1/devops-openshift"
        acr_registry = "acrakspoc1.azurecr.io/acrakspoc1"
        acrCredetials = "azure-acr-login"
        dockerImage = ''
        registryCredentials = "docker-cred"
    }

    stages
    {
        stage('Code Build')
        {
            steps 
            {
                sh "mvn clean package"
            }
        }

        stage('Docker image creation and push')
        {
            steps
            {
                script
                {
                    dockerImage = docker.build imageName + ":latest"
                    sh "docker images|grep latest"
                    withCredentials([usernamePassword(credentialsId: "${env.acrCredetials}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')])
                    {
                        sh "docker login  ${env.acr_registry} --username $USERNAME --password $PASSWORD"
                    }
                    //sh "docker push acrakspoc1.azurecr.io/acrakspoc1/devops-openshift:latest"
                    sh "docker push devops-openshift:latest"                    
                }
            }
        }
       
        stage ('K8S Deploy')
        {
            steps
            {
                script
                {
                    kubernetesDeploy(
                    configs: 'K8sDeploy.yaml',
                    kubeconfigId: 'K8S',
                    enableConfigSubstitution: true
                    )        
                }
            }
        }

    }
}
