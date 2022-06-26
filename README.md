# flask

oc new-app --name flask-stress --labels app=flask-stress https://github.com/laurobmb/flask.git\#main  --strategy=source --env STRESS_MINS='1'
