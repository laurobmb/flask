from multiprocessing import Pool
from multiprocessing import cpu_count
import time
import os

from flask import Flask,render_template
app = Flask(__name__)

MESSAGE="Red Hat Openshift COntainer Platform 4.10"

def f(x):
    set_time = os.environ['STRESS_MINS']
    timeout = time.time() + 60*float(set_time)  # X minutes from now
    while True:
        if time.time() > timeout:
            break
        x*x


@app.route('/')
def pagina_root():
    return render_template('index.html')


@app.route('/health')
def health():
    return 'up'


@app.route('/msg')
def msg():
    return MESSAGE


@app.route('/stress')
def stress():
    processes = cpu_count()
    print ('utilizing %d cores\n' % processes)
    pool = Pool(processes)
    pool.map(f, range(processes))


if __name__ == '__main__':
    app.run(
        host='0.0.0.0', 
        debug=True, 
        port=8080
        )

