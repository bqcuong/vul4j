package net.onrc.onos.ofcontroller.core.internal;

import java.util.ArrayList;
import java.util.List;

import net.floodlightcontroller.routing.Link;
import net.onrc.onos.graph.GraphDBOperation;
import net.onrc.onos.ofcontroller.core.INetMapTopologyObjects.ISwitchObject;
import net.onrc.onos.ofcontroller.core.INetMapTopologyService.ITopoLinkService;

import org.openflow.util.HexString;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tinkerpop.blueprints.Vertex;
import com.tinkerpop.gremlin.java.GremlinPipeline;
import com.tinkerpop.pipes.PipeFunction;
import com.tinkerpop.pipes.transform.PathPipe;

public class TopoLinkServiceImpl implements ITopoLinkService {
	
	protected GraphDBOperation op;
	protected final static Logger log = LoggerFactory.getLogger(TopoLinkServiceImpl.class);

	public void finalize() {
		close();
	}
	
	@Override
	public void close() {
		op.close();
	}
 
	@Override
	public List<Link> getActiveLinks() {
		op = new GraphDBOperation("");
		op.commit(); //Commit to ensure we see latest data
		Iterable<ISwitchObject> switches = op.getActiveSwitches();
		List<Link> links = new ArrayList<Link>(); 
		for (ISwitchObject sw : switches) {
			GremlinPipeline<Vertex, Link> pipe = new GremlinPipeline<Vertex, Link>();
			ExtractLink extractor = new ExtractLink();

			pipe.start(sw.asVertex());
			pipe.enablePath(true);
			pipe.out("on").out("link").in("on").path().step(extractor);
					
			while (pipe.hasNext() ) {
				Link l = pipe.next();
				links.add(l);
			}
						
		}
		op.commit();
		return links;
	}

	@Override
	public List<Link> getLinksOnSwitch(String dpid) {
		List<Link> links = new ArrayList<Link>(); 
		ISwitchObject sw = op.searchSwitch(dpid);
		GremlinPipeline<Vertex, Link> pipe = new GremlinPipeline<Vertex, Link>();
		ExtractLink extractor = new ExtractLink();

		pipe.start(sw.asVertex());
		pipe.enablePath(true);
		pipe.out("on").out("link").in("on").path().step(extractor);
			
		while (pipe.hasNext() ) {
			Link l = pipe.next();
			links.add(l);
		}
		return links;

	}

	private class ExtractLink implements PipeFunction<PathPipe<Vertex>, Link> {
		@Override
		public Link compute(PathPipe<Vertex> pipe) {
			long s_dpid = 0;
			long d_dpid = 0;
			short s_port = 0;
			short d_port = 0;
			
			@SuppressWarnings("unchecked")
			List<Vertex> V = pipe.next();
			Vertex src_sw = V.get(0);
			Vertex dest_sw = V.get(3);
			Vertex src_port = V.get(1);
			Vertex dest_port = V.get(2);
			s_dpid = HexString.toLong((String) src_sw.getProperty("dpid"));
			d_dpid = HexString.toLong((String) dest_sw.getProperty("dpid"));
			s_port = (Short) src_port.getProperty("number");
			d_port = (Short) dest_port.getProperty("number");
			
			Link l = new Link(s_dpid,s_port,d_dpid,d_port);
			
			return l;
		}
	}
}
