Certainly, here's how you can modify your script to incorporate the changes:



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
            def runAssessmentScript = {
                sh """
                    sed -i 's/HostameParam/${params.Hostname}/' `pwd`/infra/scripts/cis1.23_self_assessment.sh
                """
            }

            def runEmailScript = {
                sh """
                    sed -i 's/HostameParam/${params.Hostname}/' `pwd`/infra/scripts/cis1.23_self_assessment_email.sh
                """
            }

            def waitForJobToFinish() {
                // Implementation to check if the job has finished on three nodes
                // Replace the following line with the implementation for checking job completion
                def isJobFinishedOnThreeNodes = false

                while (!isJobFinishedOnThreeNodes) {
                    // Add a sleep to avoid continuous polling and reduce load
                    sleep 60 // Adjust the time interval as needed
                    // Check if the job is finished on three nodes
                    isJobFinishedOnThreeNodes = checkIfJobFinishedOnThreeNodes() // Function to be implemented
                }
            }

            if (params.Hostname != "") {
                runAssessmentScript()

                // Wait for the assessment script to finish on three nodes
                waitForJobToFinish()

                if (params.Hostname == "hostnameA") {
                    runEmailScript()
                }
            }
        }
    }
}

In this modified script, I've encapsulated the previous logic into a Script block, and I've included the runAssessmentScript, runEmailScript, and waitForJobToFinish functions, as well as a placeholder checkIfJobFinishedOnThreeNodes function that you will need to implement. Adjust the sleep interval and the conditions within the script as needed for your specific use case.
