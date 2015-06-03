Earthquake Demo (Ethernet Inspector for ZooKeeper)
===

Run
---

	
	$ cp config_example.json config.json
	$ ./000-build-container-image.sh
	$ ./011-start-switch.sh ### this runs in the foreground
	$ ./021-start-orchestrator.sh ### this runs in the foreground
	$ ./031-start-inspector.sh ### this runs in the foreground

	$ ./XXX-loop.sh
	..
