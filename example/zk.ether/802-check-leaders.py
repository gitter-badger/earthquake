#!/usr/bin/python
## FIXME: move these ones to the config file
HOSTS=['192.168.42.1', '192.168.42.2', '192.168.42.3']

import sys
import telnetlib
import time
import traceback
import re

def parse_stat_str(s):
    print 'Parsing %s: ' % s
    d = {'mode': 'NOTPARSED', 'zxid': 'NOTPARSED'}
    d['mode'] = re.compile('.*Mode:\s(.*)').search(s).group(1)
    d['zxid'] = re.compile('.*Zxid:\s(.*)').search(s).group(1)
    print 'Parsed %s: ' % d
    return d

def stat(host, port=2181):
    tn = telnetlib.Telnet(host, port)
    tn.write('stat')
    s = tn.read_all()
    try:
        d = parse_stat_str(s)
    except Exception as e:
        print 'Could not parse: %s' % s
        raise e
    tn.close()
    return d


def get_stats():
    l = []
    for host in HOSTS:
        d = stat(host)
        l.append(d)
    return l

def check_leader_elected(l):
    leaders = filter(lambda d: d['mode'] == 'leader', l)
    assert len(leaders) == 1, 'Bad leader election: %s' % l



def main_nowait():
    l = get_stats()
    print l
    check_leader_elected(l)
    print 'OK'
    

def main_wait():
    THRESHOLD=10
    i = 0
    while True:
        i += 1
        if i > THRESHOLD:
            raise RuntimeError('too many errors')
        try:
            main_nowait()
            return
        except Exception as e:
            traceback.print_exc()
            print 'sleeping for 3 secs'
            time.sleep(3)
        

if __name__ == '__main__':
    if '--wait' in sys.argv:
        main_wait()
    else:
        main_nowait()
            
