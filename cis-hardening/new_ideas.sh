stage('SANDBOX-DEV Install') {
    options { skipDefaultCheckout(false) }
    when {
        expression {
            params.Action == "Install" && params.Hostname != "" && params.Environment == "sandbox"
        }
    }
    agent { label "on-prem-dev-static-worker-jenkins" }

    steps {
        Script {
            if (params.Hostname != "") {
                sh """
                    sed -i 's/HostameParam/${params.Hostname}/' `pwd`/infra/scripts/cis1.23_self_assessment.sh
                """
                // Add a delay to ensure the self-assessment script has run on all nodes
                sleep 300 // Adjust the time interval as needed

                // Place the self-assessment function here
                selfAssessment("${params.Hostname}","$params.ADUsername}")
            }
        }
    }
}

stage('Run email script') {
    when {
        expression {
            currentBuild.rawBuild.getWorkspace().child('lock.file').exists()
        }
    }
    steps {
        sh """
            sed -i 's/HostameParam/${params.Hostname}/' `pwd`/infra/scripts/cis1.23_self_assessment_email.sh
        """
    }
    post {
        always {
            script {
                currentBuild.rawBuild.getWorkspace().child('lock.file').delete()
            }
        }
    }
}
