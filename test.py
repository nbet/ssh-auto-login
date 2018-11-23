from pprint import pprint
from pssh.clients.native import ParallelSSHClient

hosts = ['172.16.160.148']
client = ParallelSSHClient(hosts, user='pfang', password='123')

output = client.run_command('ip a')
for host, host_output in output.items():
    for line in host_output.stdout:
        print(line)

