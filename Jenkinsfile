pipeline {
    environment { 
        registry = "efim4ik/epam_exam-2" 
        registryCredential = 'dockerhub_id' 
        docker_Image = 'web_app_con' 
    }
    agent { label "agent-exam2" }
    stages { 
        stage('Python tests') { 
            steps {
               sh '''
                export PATH="/home/jenkins/.local/bin:$PATH"
                pip3 install -e ".[test]"
                coverage3 run -m pytest
                coverage3 report
                '''
            } 
        }
        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ':' + docker_Image
                }
            } 
        }
        stage('Push our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi ${registry}:${docker_Image}" 
                logstash {
                    
                }
            }     
        } 
    }
}
