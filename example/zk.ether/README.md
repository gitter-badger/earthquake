Earthquake Demo (Ethernet Inspector for ZooKeeper)
===
Related to [ZOOKEEPER-2172](https://issues.apache.org/jira/browse/ZOOKEEPER-2172)

Run
---
	$ ifconfig ovsbr0 up
 	$ ip addr add 192.168.42.254/24 dev ovsbr0
	$ cp config_example.json config.json
	$ ./000-build-container-image.sh
	$ ./011-start-switch.sh ### this runs in the foreground
	$ ./021-start-orchestrator.sh ### this runs in the foreground
	$ ./031-start-inspector.sh ### this runs in the foreground

	$ ./XXX-loop.sh
	..


Known issues
---
 * [pipework](https://github.com/jpetazzo/pipework) says "When a container is terminated, the network interfaces are garbage collected", but GC sometimes does not to seem working properly.
 
 