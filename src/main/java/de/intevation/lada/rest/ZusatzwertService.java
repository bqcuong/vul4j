/* Copyright (C) 2013 by Bundesamt fuer Strahlenschutz
 * Software engineering by Intevation GmbH
 *
 * This file is Free Software under the GNU GPL (v>=3) 
 * and comes with ABSOLUTELY NO WARRANTY! Check out 
 * the documentation coming with IMIS-Labordaten-Application for details. 
 */
package de.intevation.lada.rest;

import java.sql.Timestamp;
import java.util.Date;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.UriInfo;

import de.intevation.lada.lock.LockConfig;
import de.intevation.lada.lock.LockType;
import de.intevation.lada.lock.ObjectLocker;
import de.intevation.lada.model.land.LZusatzWert;
import de.intevation.lada.util.annotation.AuthorizationConfig;
import de.intevation.lada.util.annotation.RepositoryConfig;
import de.intevation.lada.util.auth.Authorization;
import de.intevation.lada.util.auth.AuthorizationType;
import de.intevation.lada.util.data.QueryBuilder;
import de.intevation.lada.util.data.Repository;
import de.intevation.lada.util.data.RepositoryType;
import de.intevation.lada.util.rest.RequestMethod;
import de.intevation.lada.util.rest.Response;

@Path("zusatzwert")
@RequestScoped
public class ZusatzwertService {

    /* The data repository granting read/write access.*/
    @Inject
    @RepositoryConfig(type=RepositoryType.RW)
    private Repository defaultRepo;

    @Inject
    @LockConfig(type=LockType.TIMESTAMP)
    private ObjectLocker lock;

    /* The authorization module.*/
    @Inject
    @AuthorizationConfig(type=AuthorizationType.OPEN_ID)
    private Authorization authorization;

    /**
     * Get all objects.
     *
     * @return Response object containing all messung objects.
     */
    @GET
    @Path("/")
    @Produces(MediaType.APPLICATION_JSON)
    public Response get(
        @Context HttpHeaders headers,
        @Context HttpServletRequest request,
        @Context UriInfo info
    ) {
        MultivaluedMap<String, String> params = info.getQueryParameters();
        if (params.isEmpty() || !params.containsKey("probeId")) {
            return defaultRepo.getAll(LZusatzWert.class, "land");
        }
        String probeId = params.getFirst("probeId");
        QueryBuilder<LZusatzWert> builder =
            new QueryBuilder<LZusatzWert>(
                defaultRepo.entityManager("land"),
                LZusatzWert.class);
        builder.and("probeId", probeId);
        return authorization.filter(
            request,
            defaultRepo.filter(builder.getQuery(), "land"),
            LZusatzWert.class);
    }

    /**
     * Get an object by id.
     *
     * @return Response object containing a single messung.
     */
    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getById(
        @Context HttpHeaders headers,
        @Context HttpServletRequest request,
        @PathParam("id") String id
    ) {
        return authorization.filter(
            request,
            defaultRepo.getById(LZusatzWert.class, Integer.valueOf(id), "land"),
            LZusatzWert.class);
    }

    @POST
    @Path("/")
    @Produces(MediaType.APPLICATION_JSON)
    public Response create(
        @Context HttpHeaders headers,
        @Context HttpServletRequest request,
        LZusatzWert zusatzwert
    ) {
        if (!authorization.isAuthorized(
                request,
                zusatzwert,
                RequestMethod.POST,
                LZusatzWert.class)
        ) {
            return new Response(false, 699, null);
        }
        /* Persist the new object*/
        return authorization.filter(
            request,
            defaultRepo.create(zusatzwert, "land"),
            LZusatzWert.class);
    }

    /**
     * Update an existing object.
     *
     * @return Response object containing the updated probe object.
     */
    @PUT
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response update(
        @Context HttpHeaders headers,
        @Context HttpServletRequest request,
        LZusatzWert zusatzwert
    ) {
        if (!authorization.isAuthorized(
                request,
                zusatzwert,
                RequestMethod.PUT,
                LZusatzWert.class)
        ) {
            return new Response(false, 699, null);
        }
        if (lock.isLocked(zusatzwert)) {
            return new Response(false, 697, null);
        }
        zusatzwert.setLetzteAenderung(new Timestamp(new Date().getTime()));
        Response response = defaultRepo.update(zusatzwert, "land");
        Response updated = defaultRepo.getById(
            LZusatzWert.class,
            ((LZusatzWert)response.getData()).getId(), "land");
        return authorization.filter(
            request,
            updated,
            LZusatzWert.class);
    }

    /**
     * Delete an existing object by id.
     *
     * @return Response object.
     */
    @DELETE
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response delete(
        @Context HttpHeaders headers,
        @Context HttpServletRequest request,
        @PathParam("id") String id
    ) {
        /* Get the object by id*/
        Response object =
            defaultRepo.getById(LZusatzWert.class, Integer.valueOf(id), "land");
        LZusatzWert obj = (LZusatzWert)object.getData();
        if (!authorization.isAuthorized(
                request,
                obj,
                RequestMethod.DELETE,
                LZusatzWert.class)
        ) {
            return new Response(false, 699, null);
        }
        if (lock.isLocked(obj)) {
            return new Response(false, 697, null);
        }
        /* Delete the object*/
        return defaultRepo.delete(obj, "land");
    }
}
