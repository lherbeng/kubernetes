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

====

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

            def checkIfJobFinishedOnNode(nodeName) {
                // Check if the job has finished on the specific node
                // Add your logic to check if the job has finished running on the given node
                // Return true if the job has finished on the node, false otherwise
                // Example:
                // Assuming you have a way to check the job status on each node, implement accordingly
                // Replace this example with your actual implementation
                // For demonstration purposes, this always returns true
                return true
            }

            def checkIfJobFinishedOnThreeNodes() {
                def count = 0
                def expectedNodeCount = 3 // Change this according to the number of nodes

                // Logic to check if the job has finished running on three nodes
                // You need to implement the appropriate logic here based on your environment

                // Example logic: Checking if the job has finished running on three nodes
                def node1Finished = checkIfJobFinishedOnNode("node1")
                def node2Finished = checkIfJobFinishedOnNode("node2")
                def node3Finished = checkIfJobFinishedOnNode("node3")

                if (node1Finished) count++
                if (node2Finished) count++
                if (node3Finished) count++

                return count >= expectedNodeCount
            }

            def waitForJobToFinish() {
                // Implementation to check if the job has finished on three nodes
                // Replace the following line with the implementation for checking job completion
                def isJobFinishedOnThreeNodes = false

                while (!isJobFinishedOnThreeNodes) {
                    // Add a sleep to avoid continuous polling and reduce load
                    sleep 60 // Adjust the time interval as needed
                    // Check if the job is finished on three nodes
                    isJobFinishedOnThreeNodes = checkIfJobFinishedOnThreeNodes()
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

Place these functions inside the Script block, alongside the other functions that you defined earlier. Adjust the functions according to the specific requirements and structure of your job.

===

To make the checkIfJobFinishedOnThreeNodes and checkIfJobFinishedOnNode functions fit your cluster, you'll need to modify them to reflect the actual logic for checking job completion on your specific nodes. Here's an example of how you can modify these functions:

def checkIfJobFinishedOnNode(nodeName) {
    // Implement logic to check if the job has finished running on the specific node
    // Replace the example implementation with your actual logic
    // Example:
    // You might use a command to check the status of the job on the specific node
    // For instance, if you are using a Kubernetes cluster, you might use kubectl commands to check the job status
    def result = sh(script: "kubectl get pods --field-selector=status.phase=Running -l app=my-app -n ${nodeName} | grep my-job", returnStdout: true).trim()
    return result.contains("my-job")
}

def checkIfJobFinishedOnThreeNodes() {
    def count = 0
    def expectedNodeCount = 3 // Adjust this based on the number of nodes in your cluster

    // Implement logic to check if the job has finished running on three nodes
    // Replace the example implementation with your actual logic
    // Example:
    // Check if the job has finished running on three nodes by calling the function for each node
    def node1Finished = checkIfJobFinishedOnNode("node1")
    def node2Finished = checkIfJobFinishedOnNode("node2")
    def node3Finished = checkIfJobFinishedOnNode("node3")

    if (node1Finished) count++
    if (node2Finished) count++
    if (node3Finished) count++

    return count >= expectedNodeCount
}

In the checkIfJobFinishedOnNode function, you'll need to replace the placeholder command kubectl get pods with the appropriate command or method for checking the job status on your specific nodes in the cluster.

Similarly, in the checkIfJobFinishedOnThreeNodes function, update the node names ("node1," "node2," "node3") with the actual names of the nodes in your cluster. Adjust the logic as per your cluster's requirements for checking job completion.
