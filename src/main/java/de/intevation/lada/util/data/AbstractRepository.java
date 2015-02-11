/* Copyright (C) 2013 by Bundesamt fuer Strahlenschutz
 * Software engineering by Intevation GmbH
 *
 * This file is Free Software under the GNU GPL (v>=3)
 * and comes with ABSOLUTELY NO WARRANTY! Check out
 * the documentation coming with IMIS-Labordaten-Application for details.
 */
package de.intevation.lada.util.data;

import javax.ejb.EJBTransactionRolledbackException;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.inject.Inject;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TransactionRequiredException;

/**
 * Abstract class implementing low level data operations.
 *
 * @author <a href="mailto:rrenkert@intevation.de">Raimund Renkert</a>
 */
@Stateless
public abstract class AbstractRepository
implements Repository
{
    @Inject
    protected EntityManagerProducer emp;

    protected String jndiPath;

    /**
     * Create object in the database.
     * This operation can not be undone.
     *
     * @param object    The object to create
     *
     * @throws EntityExistsException
     * @throws IllegalArgumentException
     * @throws EJBTransactionRolledbackException
     * @throws TransactionRequiredException
     */
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    protected void persistInDatabase(Object object, String dataSource)
    throws EntityExistsException,
        IllegalArgumentException,
        EJBTransactionRolledbackException,
        TransactionRequiredException
    {
        emp.entityManager(dataSource).persist(object);
    }

    /**
     * Create object in the database.
     * This operation can not be undone.
     *
     * @param object    The object to create
     *
     * @throws EntityExistsException
     * @throws IllegalArgumentException
     * @throws EJBTransactionRolledbackException
     * @throws TransactionRequiredException
     */
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    protected void updateInDatabase(Object object, String dataSource)
    throws EntityExistsException,
        IllegalArgumentException,
        EJBTransactionRolledbackException,
        TransactionRequiredException
    {
        emp.entityManager(dataSource).merge(object);
    }

    /**
     * Remove an object from the datebase.
     * This operation can not be undone.
     *
     * @param object    The object to remove
     *
     * @throws IllegalArgumentException
     * @throws TransactionRequiredException
     */
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    protected void removeFromDatabase(Object object, String dataSource)
    throws IllegalArgumentException,
        TransactionRequiredException
    {
        EntityManager em = emp.entityManager(dataSource);
        em.remove(
            em.contains(object) ?
                object : em.merge(object));
    }

    public Query queryFromString(String sql, String dataSource) {
        EntityManager em = emp.entityManager(dataSource);
        return em.createNativeQuery(sql);
    }

    public EntityManager entityManager(String dataSource) {
        return emp.entityManager(dataSource);
    }
}
