## kubenodenotready

**Meaning:**

The metric indicates that the number of nodes with the "Ready" condition, as reported by the kube-state-metrics job, is zero.

**Impact:**

This might imply that no nodes are in a "Ready" state, which could affect the stability and performance of your Kubernetes cluster.

**Diagnosis:**

- Check kube-state-metrics Pod Status:

kubectl get pods -n $NAMESPACE | grep kube-state-metrics

Ensure that the kube-state-metrics pod is running without errors.

- Inspect kube-state-metrics Logs:

kubectl logs -n $NAMESPACE $kube-state-metrics-pod-name

Look for any error messages or issues reported in the logs.

- Verify Node Readiness:

kubectl get nodes

Check the "STATUS" column to ensure that nodes are in a "Ready" state.

**Other things to check:**

- Kubelet Logs:

journalctl -u kubelet

Examine Kubelet logs for any errors or issues related to node readiness.

- Cluster Events:

kubectl get events --sort-by='.metadata.creationTimestamp'

Look for events related to node readiness or kube-state-metrics that might provide additional context.

**Mitigation:**

- Restart kube-state-metrics:

kubectl delete pod -n $NAMESPACE kube-state-metrics-pod-name

Deleting the pod will trigger its recreation. Check if this resolves the issue.

- Ensure that the Kubelet is properly configured, and there are no issues preventing nodes from becoming ready.

- Address any issues preventing nodes from entering the "Ready" state, such as network problems or resource constraints.

- Ensure you are using a version of kube-state-metrics that is compatible with your Kubernetes version. Consider upgrading if necessary.

- Remember to replace <namespace> and <kube-state-metrics-pod-name> with your actual namespace and pod name.




