import numpy as np
import subprocess

n_iter = 5

num_threads = [1, 4, 8]            # h2load -t flag
num_concurrent = [1, 5, 10, 25, 50]     # h2load -c flag

results = {}


_threads = {}
for t in num_threads:
    _concurrent = {}
    for c in num_concurrent:
        rps_mean = []
        for i in range(n_iter):
            print('Beginning iteration %d...' % (int(i + 1)))
            cmd = subprocess.run(['h2load', '-n10000', '-t' + str(t), '-c' + str(c), '--h1', 'https://localhost:4433'], capture_output = True).stdout
            parsed = cmd.splitlines()
            for line in parsed:
                if 'req/s' in line.decode('utf-8').split():
                    temp = line.decode('utf-8').split()
                    rps_mean.append(float(temp[4][:-2]))
        # append to dicts
        _concurrent[c] = np.mean(rps_mean)
    _threads[t] = _concurrent
        

for k, v in _threads.items():
    print('Threads: %d' % (int(k)))
    for d in v.keys():
        print('\tConcurrent Client Connections: %d' % (int(d)))
        print('\t\tRPS: %f' % (float(v[d])))

#['h2load', '--h1', 'https://localhost:4433']