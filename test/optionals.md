# Optional task answers.

## Task 4 - The application backend should run in Kubernetes on a 3 node cluster with multiple replicas of each pod.

    * Should be able to do rolling updates on the backend service without downtime
    * Application should be self healing after network issues, node outages, node restarts and other issues
    ** Assumption - the cluster has been configured successfully, all I'm doing is validating the setup.
    
The first check I'd do is figure out what namespaces are configured with the following command:
   
   * kubectl get namespace

I'd need to check the list of returned namespaces against those which should have been configured.

Something else to check is the nodes tied to the master:

   * kubectl get nodes

If the deployment has been done successfully I can use the following command to see what's been setup in the k8s yaml file:

   * kubectl -n xxxxxx get deployments

I'd expect to see the following output, given we've asked for 3 replicas to be in the cluster:

NAME       DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
xxxxxxxxx   3         3         3            3           1m

Once I have the namespace to work with, I can go ahead and tackle the pods. This is just a bit of "exploratory" k8 checking to see the lay of the land.

   * kubectl get pods -n xxxxx
   
That will show me the pods which have been created.
   


