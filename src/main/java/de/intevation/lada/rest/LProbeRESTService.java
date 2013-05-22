package de.intevation.lada.rest;

import java.util.List;
import java.util.logging.Logger;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import de.intevation.lada.data.LProbeRepository;
import de.intevation.lada.model.LProbe;
import de.intevation.lada.service.LProbeService;

/**
 * JAX-RS Example
 *
 * This class produces a RESTful service to read the contents of the members table.
*/

@Path("/proben")
@RequestScoped
public class LProbeRESTService {

    @Inject
    private LProbeRepository repository;

    @Inject
    private Logger log;

    @GET
    @Produces("text/json")
    public List<LProbe> listAllMembers() {
       final List<LProbe> result = repository.findAll();
       return result;
    }

    @GET
    @Path("/{id:[0-9][0-9]*}")
    @Produces("text/plain")
    public String loadById() {
       return "Eine Probe!";
    }

    @GET
    @Path("/deleteLast")
    @Produces("text/plain")
    public String deleteLast() {
       final List<LProbe> result = repository.findAll();
       LProbe last_element = result.get(result.size()-1);
       repository.delete(last_element);
       return "Gelöscht id" + last_element.getProbeId();
    }

    @GET
    @Path("/new")
    @Produces("text/plain")
    public String create() {
       return "Neu";
    }
    //@GET
    //@Produces("text/xml")
    //public List<Member> listAllMembers() {
    //   // Us @SupressWarnings to force IDE to ignore warnings about "genericizing" the results of
    //   // this query
    //   @SuppressWarnings("unchecked")
    //   // We recommend centralizing inline queries such as this one into @NamedQuery annotations on
    //   // the @Entity class
    //   // as described in the named query blueprint:
    //   // https://blueprints.dev.java.net/bpcatalog/ee5/persistence/namedquery.html
    //   final List<Member> results = em.createQuery("select m from Member m order by m.name").getResultList();
    //   return results;
    //}

    //@GET
    //@Path("/{id:[0-9][0-9]*}")
    //@Produces("text/xml")
    //public Member lookupMemberById(@PathParam("id") long id) {
    //   return em.find(Member.class, id);
    //}
}
