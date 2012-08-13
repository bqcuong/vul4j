/*
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
 *
 * Copyright (c) 2008-2012 Oracle and/or its affiliates. All rights reserved.
 *
 * The contents of this file are subject to the terms of either the GNU
 * General Public License Version 2 only ("GPL") or the Common Development
 * and Distribution License("CDDL") (collectively, the "License").  You
 * may not use this file except in compliance with the License.  You can
 * obtain a copy of the License at
 * https://glassfish.dev.java.net/public/CDDL+GPL_1_1.html
 * or packager/legal/LICENSE.txt.  See the License for the specific
 * language governing permissions and limitations under the License.
 *
 * When distributing the software, include this License Header Notice in each
 * file and include the License file at packager/legal/LICENSE.txt.
 *
 * GPL Classpath Exception:
 * Oracle designates this particular file as subject to the "Classpath"
 * exception as provided by Oracle in the GPL Version 2 section of the License
 * file that accompanied this code.
 *
 * Modifications:
 * If applicable, add the following below the License Header, with the fields
 * enclosed by brackets [] replaced by your own identifying information:
 * "Portions Copyright [year] [name of copyright owner]"
 *
 * Contributor(s):
 * If you wish your version of this file to be governed by only the CDDL or
 * only the GPL Version 2, indicate your decision by adding "[Contributor]
 * elects to include this software in this distribution under the [CDDL or GPL
 * Version 2] license."  If you don't indicate a single choice of license, a
 * recipient has the option to distribute your version of this file under
 * either the CDDL, the GPL Version 2 or to extend the choice of license to
 * its licensees as provided above.  However, if you add GPL Version 2 code
 * and therefore, elected the GPL Version 2 license, then the option applies
 * only if the new code is made subject to such option by the copyright
 * holder.
 *
 *
 * This file incorporates work covered by the following copyright and
 * permission notice:
 *
 * Copyright 2004 The Apache Software Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.glassfish.grizzly.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.AccessController;
import java.security.PrivilegedActionException;
import java.security.PrivilegedExceptionAction;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.DispatcherType;
import static javax.servlet.DispatcherType.INCLUDE;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestWrapper;
import javax.servlet.ServletResponse;
import javax.servlet.ServletResponseWrapper;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.glassfish.grizzly.Grizzly;
import org.glassfish.grizzly.http.server.util.Globals;

/**
 * Standard implementation of <code>RequestDispatcher</code> that allows a
 * request to be forwarded to a different resource to create the ultimate
 * response, or to include the output of another resource in the response
 * from this resource.  This implementation allows application level servlets
 * to wrap the request and/or response objects that are passed on to the
 * called resource, as long as the wrapping classes extend
 * <code>javax.servlet.ServletRequestWrapper</code> and
 * <code>javax.servlet.ServletResponseWrapper</code>.
 *
 * @author Craig R. McClanahan
 * @author Bongjae Chang
 */
public final class RequestDispatcherImpl implements RequestDispatcher {

    private final static Logger logger = Grizzly.logger( RequestDispatcherImpl.class );

    /**
     * is this dispatch cross context
     */
    private Boolean crossContextFlag = null;

    /**
     * The servlet name for a named dispatcher.
     */
    private String name = null;

    /**
     * The request URI for this RequestDispatcher.
     */
    private String requestURI = null;

    /**
     * The servlet path for this RequestDispatcher.
     */
    private String servletPath = null;

    /**
     * The extra path information for this RequestDispatcher.
     */
    private String pathInfo = null;

    /**
     * The query string parameters for this RequestDispatcher.
     */
    private String queryString = null;

    /**
     * The Wrapper associated with the resource that will be forwarded to
     * or included.
     */
    private ServletHandler wrapper = null;

    /**
     * Construct a new instance of this class, configured according to the
     * specified parameters.  If both servletPath and pathInfo are
     * <code>null</code>, it will be assumed that this RequestDispatcher
     * was acquired by name, rather than by path.
     *
     * @param wrapper     The Wrapper associated with the resource that will
     *                    be forwarded to or included (required)
     * @param requestURI  The request URI to this resource (if any)
     * @param servletPath The revised servlet path to this resource (if any)
     * @param pathInfo    The revised extra path information to this resource
     *                    (if any)
     * @param queryString Query string parameters included with this request
     *                    (if any)
     * @param name        Servlet name (if a named dispatcher was created)
     *                    else <code>null</code>
     */
    public RequestDispatcherImpl( ServletHandler wrapper,
                                  String requestURI,
                                  String servletPath,
                                  String pathInfo,
                                  String queryString,
                                  String name ) {
        // Save all of our configuration parameters
        this.wrapper = wrapper;
        this.requestURI = requestURI;
        this.servletPath = servletPath;
        this.pathInfo = pathInfo;
        this.queryString = queryString;
        this.name = name;

        if( logger.isLoggable( Level.FINE ) )
            logger.log(Level.FINE, "servletPath={0}, pathInfo={1}, queryString={2}, name={3}",
                    new Object[]{this.servletPath, this.pathInfo, queryString, this.name});
    }

    /**
     * Forwards the given request and response to the resource
     * for which this dispatcher was acquired.
     * <p/>
     * <p>Any runtime exceptions, IOException, or ServletException thrown
     * by the target will be propogated to the caller.
     *
     * @param request  The request to be forwarded
     * @param response The response to be forwarded
     *
     * @throws IOException      if an input/output error occurs
     * @throws ServletException if a servlet exception occurs
     */
    @Override
    public void forward( ServletRequest request, ServletResponse response )
            throws ServletException, IOException {
        dispatch( request, response, DispatcherType.FORWARD );
    }

    /**
     * Dispatches the given request and response to the resource
     * for which this dispatcher was acquired.
     * <p/>
     * <p>Any runtime exceptions, IOException, or ServletException thrown
     * by the target will be propogated to the caller.
     *
     * @param request        The request to be forwarded
     * @param response       The response to be forwarded
     * @param dispatcherType The type of dispatch to be performed
     *
     * @throws IOException              if an input/output error occurs
     * @throws ServletException         if a servlet exception occurs
     * @throws IllegalArgumentException if the dispatcher type is different
     *                                  from FORWARD, ERROR, and ASYNC
     */
    @SuppressWarnings( "unchecked" )
    public void dispatch( ServletRequest request, ServletResponse response, DispatcherType dispatcherType )
            throws ServletException, IOException {
        if( !DispatcherType.FORWARD.equals( dispatcherType ) &&
            !DispatcherType.ERROR.equals( dispatcherType ) &&
            !DispatcherType.ASYNC.equals( dispatcherType ) ) {
            throw new IllegalArgumentException( "Illegal dispatcher type" );
        }

        boolean isCommit = ( DispatcherType.FORWARD.equals( dispatcherType ) ||
                             DispatcherType.ERROR.equals( dispatcherType ) );

        if( System.getSecurityManager() != null ) {
            try {
                PrivilegedDispatch dp = new PrivilegedDispatch(
                        request, response, dispatcherType );
                AccessController.doPrivileged( dp );
                // START SJSAS 6374990
                if( isCommit ) {
                    closeResponse( response );
                }
                // END SJSAS 6374990
            } catch( PrivilegedActionException pe ) {
                Exception e = pe.getException();
                if( e instanceof ServletException )
                    throw (ServletException)e;
                throw (IOException)e;
            }
        } else {
            doDispatch( request, response, dispatcherType );
            // START SJSAS 6374990
            if( isCommit ) {
                closeResponse( response );
            }
            // END SJSAS 6374990
        }
    }

    private void doDispatch( ServletRequest request, ServletResponse response, DispatcherType dispatcherType )
            throws ServletException, IOException {
        if( !DispatcherType.ASYNC.equals( dispatcherType ) ) {
            // Reset any output that has been buffered, but keep
            // headers/cookies
            if( response.isCommitted() ) {
                if( logger.isLoggable( Level.FINE ) )
                    logger.fine( "  Forward on committed response --> ISE" );
                throw new IllegalStateException( "Cannot forward after response has been committed" );
            }

            try {
                response.resetBuffer();
            } catch( IllegalStateException e ) {
                if( logger.isLoggable( Level.FINE ) )
                    logger.log( Level.FINE, "  Forward resetBuffer() returned ISE: {0}", e);
                throw e;
            }
        }

        // Set up to handle the specified request and response
        State state = new State( request, response, dispatcherType );

        // Identify the HTTP-specific request and response objects (if any)
        HttpServletRequest hrequest = null;
        if( request instanceof HttpServletRequest ) {
            hrequest = (HttpServletRequest)request;
        }
        HttpServletResponse hresponse = null;
        if( response instanceof HttpServletResponse ) {
            hresponse = (HttpServletResponse)response;
        }

        if( ( hrequest == null ) || ( hresponse == null ) ) {
            // Handle a non-HTTP forward
            DispatchedHttpServletRequest wrequest = wrapRequest( state );
            processRequest( request, response, state, dispatcherType );
            unwrapRequest( state );
            wrequest.recycle();
        } else if( ( servletPath == null ) && ( pathInfo == null ) ) {
            // Handle an HTTP named dispatcher forward
            DispatchedHttpServletRequest wrequest = wrapRequest( state );
            wrequest.setContextPath( hrequest.getContextPath() );
            wrequest.setRequestURI( hrequest.getRequestURI() );
            wrequest.setServletPath( hrequest.getServletPath() );
            wrequest.setPathInfo( hrequest.getPathInfo() );
            wrequest.setQueryString( hrequest.getQueryString() );
            processRequest( request, response, state, dispatcherType );
            unwrapRequest( state );
            wrequest.recycle();
        } else {
            // Handle an HTTP path-based forward
            DispatchedHttpServletRequest wrequest = wrapRequest( state );

            // If the request is being FORWARD- or ASYNC-dispatched for
            // the first time, initialize it with the required request
            // attributes
            if( ( DispatcherType.FORWARD.equals( dispatcherType ) &&
                  hrequest.getAttribute( DispatcherConstants.FORWARD_REQUEST_URI ) == null ) ||
                ( DispatcherType.ASYNC.equals( dispatcherType ) &&
                  hrequest.getAttribute( DispatcherConstants.ASYNC_REQUEST_URI ) == null ) ) {
                wrequest.initSpecialAttributes( hrequest.getRequestURI(),
                                                hrequest.getContextPath(),
                                                hrequest.getServletPath(),
                                                hrequest.getPathInfo(),
                                                hrequest.getQueryString() );
            }

            String targetContextPath = wrapper.getContextPath();
            // START IT 10395
            HttpServletRequestImpl requestFacade = wrequest.getRequestFacade();
            String originContextPath = requestFacade.getContextPath();
            if( originContextPath != null &&
                originContextPath.equals( targetContextPath ) ) {
                targetContextPath = hrequest.getContextPath();
            }
            // END IT 10395
            wrequest.setContextPath( targetContextPath );
            wrequest.setRequestURI( requestURI );
            wrequest.setServletPath( servletPath );
            wrequest.setPathInfo( pathInfo );
            if( queryString != null ) {
                wrequest.setQueryString( queryString );
            }

            processRequest( request, response, state, dispatcherType);

            unwrapRequest( state );
            wrequest.recycle();
        }
    }


    /**
     * Prepare the request based on the filter configuration.
     *
     * @param request  The servlet request we are processing
     * @param response The servlet response we are creating
     *
     * @throws IOException      if an input/output error occurs
     * @throws ServletException if a servlet error occurs
     */
    private void processRequest( ServletRequest request,
                                 ServletResponse response,
                                 State state,
                                 DispatcherType dispatcherType)
            throws IOException, ServletException {
        if( request != null ) {
            if( state.dispatcherType != DispatcherType.ERROR ) {
                state.outerRequest.setAttribute( Globals.DISPATCHER_REQUEST_PATH_ATTR, getCombinedPath() );
                invoke( state.outerRequest, response, dispatcherType );
            } else {
                invoke( state.outerRequest, response, dispatcherType );
            }
        }
    }

    /**
     * Combines the servletPath and the pathInfo.
     * <p/>
     * If pathInfo is <code>null</code>, it is ignored. If servletPath
     * is <code>null</code>, then <code>null</code> is returned.
     *
     * @return The combined path with pathInfo appended to servletInfo
     */
    private String getCombinedPath() {
        if( servletPath == null ) {
            return null;
        }
        if( pathInfo == null ) {
            return servletPath;
        }
        return servletPath + pathInfo;
    }

    /**
     * Include the response from another resource in the current response.
     * Any runtime exception, IOException, or ServletException thrown by the
     * called servlet will be propogated to the caller.
     *
     * @param request  The servlet request that is including this one
     * @param response The servlet response to be appended to
     *
     * @throws IOException      if an input/output error occurs
     * @throws ServletException if a servlet exception occurs
     */
    @SuppressWarnings( "unchecked" )
    @Override
    public void include( ServletRequest request, ServletResponse response )
            throws ServletException, IOException {
        if( System.getSecurityManager() != null ) {
            try {
                PrivilegedInclude dp = new PrivilegedInclude( request, response );
                AccessController.doPrivileged( dp );
            } catch( PrivilegedActionException pe ) {
                Exception e = pe.getException();
                if( e instanceof ServletException )
                    throw (ServletException)e;
                throw (IOException)e;
            }
        } else {
            doInclude( request, response );
        }
    }

    private void doInclude( ServletRequest request, ServletResponse response )
            throws ServletException, IOException {

        // Set up to handle the specified request and response
        State state = new State( request, response, INCLUDE );

        // Create a wrapped response to use for this request
        wrapResponse( state );

        // START GlassFish 6386229
        // Handle an HTTP named dispatcher include
        if( name != null ) {
            // END GlassFish 6386229
            DispatchedHttpServletRequest wrequest = wrapRequest( state );
            wrequest.setAttribute( Globals.NAMED_DISPATCHER_ATTR, name );
            wrequest.setAttribute( Globals.DISPATCHER_REQUEST_PATH_ATTR, getCombinedPath() );
            try {
                invoke( state.outerRequest, state.outerResponse, INCLUDE);
            } finally {
                unwrapRequest( state );
                unwrapResponse( state );
            }
        }
        // Handle an HTTP path based include
        else {
            DispatchedHttpServletRequest wrequest = wrapRequest( state );
            wrequest.initSpecialAttributes( requestURI,
                                            wrapper.getContextPath(),
                                            servletPath,
                                            pathInfo,
                                            queryString );
            if( queryString != null ) {
                wrequest.setQueryString( queryString );
            }
            wrequest.setAttribute( Globals.DISPATCHER_REQUEST_PATH_ATTR,getCombinedPath() );
            try {
                invoke( state.outerRequest, state.outerResponse, INCLUDE);
            } finally {
                unwrapRequest( state );
                unwrapResponse( state );
            }
        }
    }

    /**
     * Ask the resource represented by this RequestDispatcher to process
     * the associated request, and create (or append to) the associated
     * response.
     * <p/>
     * <strong>IMPLEMENTATION NOTE</strong>: This implementation assumes
     * that no filters are applied to a forwarded or included resource,
     * because they were already done for the original request.
     *
     * @param request  The servlet request we are processing
     * @param response The servlet response we are creating
     *
     * @throws IOException      if an input/output error occurs
     * @throws ServletException if a servlet error occurs
     */
    private void invoke(final ServletRequest request,
                        final ServletResponse response,
                        final DispatcherType dispatcherType)
            throws IOException, ServletException {
        boolean crossContext = false;
        if( crossContextFlag != null && crossContextFlag) {
            crossContext = true;
        }
        try {
            doInvoke(request, response, crossContext, dispatcherType);
        } finally {
            crossContextFlag = null;
        }
    }

    /**
     * Ask the resource represented by this RequestDispatcher to process
     * the associated request, and create (or append to) the associated
     * response.
     * <p/>
     * <strong>IMPLEMENTATION NOTE</strong>: This implementation assumes
     * that no filters are applied to a forwarded or included resource,
     * because they were already done for the original request.
     *
     * @param request  The servlet request we are processing
     * @param response The servlet response we are creating
     *
     * @throws IOException      if an input/output error occurs
     * @throws ServletException if a servlet error occurs
     */
    private void doInvoke(ServletRequest request,
                          ServletResponse response,
                          boolean crossContext,
                          DispatcherType dispatcherType)
            throws IOException, ServletException {
        ClassLoader oldCCL = null;
        try {
            // Checking to see if the context classloader is the current context
            // classloader. If it's not, we're saving it, and setting the context
            // classloader to the Context classloader
            if( crossContext ) {
                ClassLoader contextClassLoader = wrapper.getClassLoader();
                if( contextClassLoader != null ) {
                    oldCCL = Thread.currentThread().getContextClassLoader();
                    Thread.currentThread().setContextClassLoader( contextClassLoader );
                }
            }
            wrapper.doServletService(request, response, dispatcherType);
        } finally {
            // Reset the old context class loader
            if( oldCCL != null )
                Thread.currentThread().setContextClassLoader( oldCCL );
        }
    }

    /**
     * Unwrap the request if we have wrapped it.
     */
    private void unwrapRequest( State state ) {
        if( state.wrapRequest == null )
            return;

        ServletRequest previous = null;
        ServletRequest current = state.outerRequest;

        while( current != null ) {

            // If we run into the container request we are done
            if( current instanceof HttpServletRequestImpl )
                break;

            // Remove the current request if it is our wrapper
            if( current == state.wrapRequest ) {
                ServletRequest next =
                        ( (ServletRequestWrapper)current ).getRequest();
                if( previous == null )
                    state.outerRequest = next;
                else
                    ( (ServletRequestWrapper)previous ).setRequest( next );
                break;
            }

            // Advance to the next request in the chain
            previous = current;
            current = ( (ServletRequestWrapper)current ).getRequest();
        }
    }

    /**
     * Unwrap the response if we have wrapped it.
     */
    private void unwrapResponse( State state ) {

        if( state.wrapResponse == null )
            return;

        ServletResponse previous = null;
        ServletResponse current = state.outerResponse;

        while( current != null ) {

            // If we run into the container response we are done
            if( current instanceof HttpServletResponseImpl )
                break;

            // Remove the current response if it is our wrapper
            if( current == state.wrapResponse ) {
                ServletResponse next =
                        ( (ServletResponseWrapper)current ).getResponse();
                if( previous == null )
                    state.outerResponse = next;
                else
                    ( (ServletResponseWrapper)previous ).setResponse( next );
                break;
            }

            // Advance to the next response in the chain
            previous = current;
            current = ( (ServletResponseWrapper)current ).getResponse();
        }
    }

    /**
     * Create and return a request wrapper that has been inserted in the
     * appropriate spot in the request chain.
     */
    private DispatchedHttpServletRequest wrapRequest( State state ) {

        // Locate the request we should insert in front of
        ServletRequest previous = null;
        ServletRequest current = state.outerRequest;

        while( current != null ) {
            if( !( current instanceof ServletRequestWrapper ) ) {
                break;
            }
            // If we find container-generated wrapper, break out
            if( current instanceof DispatchedHttpServletRequest ) {
                break;
            }

            previous = current;
            current = ( (ServletRequestWrapper)current ).getRequest();
        }
        if( current == null ) {
            return null;
        }

        // Compute a crossContext flag
        HttpServletRequest hcurrent = (HttpServletRequest)current;
        //START OF 6364900
        crossContextFlag = !(wrapper.getContextPath().equals( hcurrent.getContextPath()));

        // Instantiate a new wrapper and insert it in the chain
        DispatchedHttpServletRequest wrapperLocal = new DispatchedHttpServletRequest( hcurrent, state.dispatcherType );
        if( previous == null ) {
            state.outerRequest = wrapperLocal;
        } else {
            ( (ServletRequestWrapper)previous ).setRequest( wrapperLocal );
        }

        state.wrapRequest = wrapperLocal;

        return wrapperLocal;
    }

    /**
     * Create and return a response wrapper that has been inserted in the
     * appropriate spot in the response chain.
     */
    private ServletResponse wrapResponse( State state ) {

        // Locate the response we should insert in front of
        ServletResponse previous = null;
        ServletResponse current = state.outerResponse;

        while( current != null ) {
            if( !( current instanceof ServletResponseWrapper ) )
                break;
            if( current instanceof DispatchedHttpServletResponse )
                break;

            previous = current;
            current = ( (ServletResponseWrapper)current ).getResponse();
        }

        if( current == null ) {
            return null;
        }

        HttpServletResponse hcurrent = (HttpServletResponse)current;
        // Instantiate a new wrapper and insert it in the chain
        DispatchedHttpServletResponse wrapperLocal = new DispatchedHttpServletResponse( hcurrent,
                                                                                   INCLUDE.equals( state.dispatcherType ) );
        if( previous == null )
            state.outerResponse = wrapperLocal;
        else
            ( (ServletResponseWrapper)previous ).setResponse( wrapperLocal );
        state.wrapResponse = wrapperLocal;

        return wrapperLocal;
    }

    private static void closeResponse( ServletResponse response ) {
        try {
            PrintWriter writer = response.getWriter();
            writer.flush();
            writer.close();
        } catch( IllegalStateException e ) {
            try {
                ServletOutputStream stream = response.getOutputStream();
                stream.flush();
                stream.close();
            } catch(IllegalStateException ignored) {
            } catch(IOException ignored) {
            }
        } catch(IOException ignored) {
        }
    }

    private class PrivilegedDispatch implements PrivilegedExceptionAction {

        private ServletRequest request;
        private ServletResponse response;
        private DispatcherType dispatcherType;

        PrivilegedDispatch( ServletRequest request, ServletResponse response,
                            DispatcherType dispatcherType ) {
            this.request = request;
            this.response = response;
            this.dispatcherType = dispatcherType;
        }

        @Override
        public Object run() throws java.lang.Exception {
            doDispatch( request, response, dispatcherType );
            return null;
        }
    }

    private class PrivilegedInclude implements PrivilegedExceptionAction {

        private ServletRequest request;
        private ServletResponse response;

        PrivilegedInclude( ServletRequest request, ServletResponse response ) {
            this.request = request;
            this.response = response;
        }

        @Override
        public Object run() throws ServletException, IOException {
            doInclude( request, response );
            return null;
        }
    }

    /**
     * Used to pass state when the request dispatcher is used. Using instance
     * variables causes threading issues and state is too complex to pass and
     * return single ServletRequest or ServletResponse objects.
     */
    private static class State {

        // Outermost request that will be passed on to the invoked servlet
        ServletRequest outerRequest = null;

        // Outermost response that will be passed on to the invoked servlet.
        ServletResponse outerResponse = null;

        // Request wrapper we have created and installed (if any).
        ServletRequest wrapRequest = null;

        // Response wrapper we have created and installed (if any).
        ServletResponse wrapResponse = null;

        // The type of dispatch we are performing
        DispatcherType dispatcherType;

        State( ServletRequest request, ServletResponse response, DispatcherType dispatcherType ) {
            this.outerRequest = request;
            this.outerResponse = response;
            this.dispatcherType = dispatcherType;
        }
    }
}
