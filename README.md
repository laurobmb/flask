# Example flask app

### Deploy
    oc new-project flask-stress
    oc -n flask-stress new-app --name flask-stress --labels app=flask-stress https://github.com/laurobmb/flask.git#main  --strategy=source --env STRESS_MINS='1'
    oc -n flask-stress set env deployment/flask-stress STRESS_MINS='1'
    oc -n flask-stress expose service flask-stress

### Create resources limits
    oc -n flask-stress set resources deployment/flask-stress --limits=cpu=300m,memory=128Mi --requests=cpu=30m,memory=32Mi
    oc -n flask-stress autoscale deployment flask-stress --max 30 --min 2 --cpu-percent=70
    oc -n flask-stress create quota flask-stress-quota --hard=cpu=500m,memory=500Mi

### Create healthcheck
    oc -n flask-stress set probe deployment/flask-stress --readiness --initial-delay-seconds=10 --timeout-seconds=30 --get-url=http://:8080/health
    oc -n flask-stress set probe deployment/flask-stress --liveness --initial-delay-seconds=10 --timeout-seconds=30 --get-url=http://:8080/health
        
### STRESS TEST   
    oc -n flask-stress set env deployment/flask-stress STRESS_MINS='1'
    URL=`oc -n flask-stress get route -o jsonpath='{.items[*].spec.host}{"\n"}'`
    curl -vk http://$URL/stress

### Check health
    URL=`oc -n flask-stress get route -o jsonpath='{.items[*].spec.host}{"\n"}'`
    curl -vk http://$URL/health