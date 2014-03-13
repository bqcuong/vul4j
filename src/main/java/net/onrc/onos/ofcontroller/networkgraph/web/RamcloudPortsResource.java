package net.onrc.onos.ofcontroller.networkgraph.web;

import net.onrc.onos.datastore.topology.KVPort;

import org.restlet.resource.Get;
import org.restlet.resource.ServerResource;

public class RamcloudPortsResource extends ServerResource {

	@Get("json")
	public Iterable<KVPort> retrieve() {
		return KVPort.getAllPorts();
	}
}
