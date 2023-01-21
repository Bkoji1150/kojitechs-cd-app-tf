
pipeline {
        agent any
    parameters { 
        choice(name: 'ENVIRONMENT', choices: ['default', 'prod', 'sbx', 'default'], description: "SELECT THE ACCOUNT YOU'D LIKE TO DEPLOY TO.")
        choice(name: 'ACTION', choices: ['apply', 'apply', 'destroy'], description: 'Select action, BECAREFUL IF YOU SELECT DESTROY TO PROD')
        string(name: 'container_version', defaultValue: 'latest', description: 'provide the container version for app',)
    }
    stages{    
        stage('TerraformInit'){
            steps {          
                sh """
                    rm -rf .terraform 
                    terraform   init -upgrade=true
                    echo \$PWD
                    whoami
                """
            }
        }
    stage('Create Terraform workspace'){
            steps {
                script {
                    try {
                        sh "terraform  workspace select ${params.ENVIRONMENT}"
                    } catch (Exception e) {
                        echo "Error occurred: ${e.getMessage()}"
                        sh """
                            terraform  workspace new ${params.ENVIRONMENT}
                            terraform  workspace select ${params.ENVIRONMENT}
                        """
                    }
    
                }
        }          
    }
        stage('Terraform plan'){
            steps { 
                    script {    
                        try{
                            sh "terraform  plan -var container_version='${params.container_version}' -refresh=true -lock=false -no-color -out='${params.ENVIRONMENT}.plan'"
                        } catch (Exception e){
                            echo "Error occurred while running"
                            echo e.getMessage()
                            sh "terraform  plan -var container_version='${params.container_version}' -refresh=true -lock=false -no-color -out='${params.ENVIRONMENT}.plan'"
                        }
                        
                        }
            }
        }
        stage('Confirm your action') {
            steps {
                script {
                    timeout(time: 5, unit: 'MINUTES') {
                    def userInput = input(id: 'confirm', message: params.ACTION + '?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
                }
                }  
            }
        }
    stage('Terraform apply or destroy ----------------') {
            steps {
            sh 'echo "continue"'
            script{        
                if (params.ACTION == "destroy"){
                    script {
                        try {
                            sh """
                                echo "llego" + params.ACTION
                                terraform  destroy -var container_version='${params.container_version}' -no-color -auto-approve
                            """
                        } catch (Exception e){
                            echo "Error occurred: ${e}"
                            sh "terraform  destroy -var  container_version='${params.container_version}' -no-color -auto-approve"
                        }
                    }
                    
            }else {
                        sh"""
                            echo  "llego" + params.ACTION
                            terraform  apply ${params.ENVIRONMENT}.plan -no-color
                        """ 
                }  // if
            }
            } //steps
        }  //stage
    }
    post {
            success {
                slackSend botUser: true, channel: 'jenkins_notification', color: 'good',
                message: " with ${currentBuild.fullDisplayName} completed successfully.\nMore info ${env.BUILD_URL}\nLogin to ${params.ENVIRONMENT} and confirm.", 
                teamDomain: 'slack', tokenCredentialId: 'slack-token'
            }
            failure {
                slackSend botUser: true, channel: 'jenkins_notification', color: 'danger',
                message: "Build faild${currentBuild.fullDisplayName} failed.", 
                teamDomain: 'slack', tokenCredentialId: 'slack-token'
            }
            aborted {
                slackSend botUser: true, channel: 'jenkins_notification', color: 'hex',
                message: "Job aborted with build name ${currentBuild.fullDisplayName} got aborted.\nMore Info ${env.BUILD_URL}", 
                teamDomain: 'slack', tokenCredentialId: 'slack-token'
            }
            cleanup {
                cleanWs()
            }
        }
}
 
