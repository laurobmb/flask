# Deploy
* oc apply -k k8s/overlays/flask-prd
* oc apply -k k8s/overlays/flask-hml
# Aplicar anotation
* oc annotate ns/flask-hml openshift.io/requester=enable
# Aplicar cluster quota
* oc apply -f k8s/clusterquota.yaml
# Deletando app
* oc delete -k k8s/overlays/flask-prd
* oc delete -k k8s/overlays/flask-hml
