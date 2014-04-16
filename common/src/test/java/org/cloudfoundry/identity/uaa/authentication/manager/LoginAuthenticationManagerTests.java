/*******************************************************************************
 *     Cloud Foundry 
 *     Copyright (c) [2009-2014] Pivotal Software, Inc. All Rights Reserved.
 *
 *     This product is licensed to you under the Apache License, Version 2.0 (the "License").
 *     You may not use this product except in compliance with the License.
 *
 *     This product includes a number of subcomponents with
 *     separate copyright notices and license terms. Your use of these
 *     subcomponents is subject to the terms and conditions of the
 *     subcomponent's license, as noted in the LICENSE file.
 *******************************************************************************/

package org.cloudfoundry.identity.uaa.authentication.manager;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.util.Arrays;

import org.cloudfoundry.identity.uaa.authentication.AuthzAuthenticationRequest;
import org.cloudfoundry.identity.uaa.authentication.UaaAuthenticationTestFactory;
import org.cloudfoundry.identity.uaa.authentication.UaaPrincipal;
import org.cloudfoundry.identity.uaa.user.UaaUser;
import org.cloudfoundry.identity.uaa.user.UaaUserDatabase;
import org.cloudfoundry.identity.uaa.user.UaaUserTestFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.provider.DefaultAuthorizationRequest;
import org.springframework.security.oauth2.provider.OAuth2Authentication;

/**
 * @author Dave Syer
 * 
 */
public class LoginAuthenticationManagerTests {

    private LoginAuthenticationManager manager = new LoginAuthenticationManager();

    private UaaUserDatabase userDatabase = Mockito.mock(UaaUserDatabase.class);

    private OAuth2Authentication oauth2Authentication;

    @Before
    public void init() {
        manager.setApplicationEventPublisher(Mockito.mock(ApplicationEventPublisher.class));
        manager.setUserDatabase(userDatabase);
        oauth2Authentication = new OAuth2Authentication(new DefaultAuthorizationRequest("client", Arrays.asList("read",
                        "write")), null);
        SecurityContextImpl context = new SecurityContextImpl();
        context.setAuthentication(oauth2Authentication);
        SecurityContextHolder.setContext(context);
    }

    @After
    public void clean() {
        SecurityContextHolder.clearContext();
    }

    @Test
    public void testNotProcessingWrongType() {
        Authentication authentication = manager.authenticate(new UsernamePasswordAuthenticationToken("foo", "bar"));
        assertNull(authentication);
    }

    @Test
    public void testNotProcessingNotAuthenticated() {
        SecurityContextHolder.clearContext();
        Authentication authentication = manager.authenticate(UaaAuthenticationTestFactory
                        .getAuthenticationRequest("foo"));
        assertNull(authentication);
    }

    @Test
    public void testHappyDayNoAutoAdd() {
        UaaUser user = UaaUserTestFactory.getUser("FOO", "foo", "fo@test.org", "Foo", "Bar");
        Mockito.when(userDatabase.retrieveUserByName("foo")).thenReturn(user);
        Authentication authentication = manager.authenticate(UaaAuthenticationTestFactory
                        .getAuthenticationRequest("foo"));
        assertEquals(user.getUsername(), ((UaaPrincipal) authentication.getPrincipal()).getName());
        assertEquals(user.getId(), ((UaaPrincipal) authentication.getPrincipal()).getId());
    }

    @Test
    public void testHappyDayWithAuthorities() {
        UaaUser user = UaaUserTestFactory.getAdminUser("FOO", "foo", "fo@test.org", "Foo", "Bar");
        Mockito.when(userDatabase.retrieveUserByName("foo")).thenReturn(user);
        Authentication authentication = manager.authenticate(UaaAuthenticationTestFactory
                        .getAuthenticationRequest("foo"));
        assertEquals(user.getUsername(), ((UaaPrincipal) authentication.getPrincipal()).getName());
        assertEquals(user.getAuthorities(), authentication.getAuthorities());
    }

    @Test(expected = BadCredentialsException.class)
    public void testUserNotFoundNoAutoAdd() {
        Mockito.when(userDatabase.retrieveUserByName("foo")).thenThrow(new UsernameNotFoundException("planned"));
        manager.authenticate(UaaAuthenticationTestFactory.getAuthenticationRequest("foo"));
    }

    @Test
    public void testHappyDayAutoAddButWithExistingUser() {
        UaaUser user = UaaUserTestFactory.getUser("FOO", "foo", "fo@test.org", "Foo", "Bar");
        Mockito.when(userDatabase.retrieveUserByName("foo")).thenReturn(user);
        Authentication authentication = manager.authenticate(UaaAuthenticationTestFactory
                        .getAuthenticationRequest("foo", true));
        assertEquals(user.getUsername(), ((UaaPrincipal) authentication.getPrincipal()).getName());
        assertEquals(user.getId(), ((UaaPrincipal) authentication.getPrincipal()).getId());
    }

    @Test
    public void testHappyDayAutoAddButWithNewUser() {
        UaaUser user = UaaUserTestFactory.getUser("FOO", "foo", "fo@test.org", "Foo", "Bar");
        Mockito.when(userDatabase.retrieveUserByName("foo")).thenThrow(new UsernameNotFoundException("planned"))
                        .thenReturn(user);
        Authentication authentication = manager.authenticate(UaaAuthenticationTestFactory
                        .getAuthenticationRequest("foo", true));
        assertEquals(user.getUsername(), ((UaaPrincipal) authentication.getPrincipal()).getName());
        assertEquals(user.getId(), ((UaaPrincipal) authentication.getPrincipal()).getId());
    }

    @Test(expected = BadCredentialsException.class)
    public void testFailedAutoAddButWithNewUser() {
        UaaUser user = UaaUserTestFactory.getUser("FOO", "foo", "fo@test.org", "Foo", "Bar");
        Mockito.when(userDatabase.retrieveUserByName("foo")).thenThrow(new UsernameNotFoundException("planned"));
        Authentication authentication = manager.authenticate(UaaAuthenticationTestFactory
                        .getAuthenticationRequest("foo", true));
        assertEquals(user.getUsername(), ((UaaPrincipal) authentication.getPrincipal()).getName());
        assertEquals(user.getId(), ((UaaPrincipal) authentication.getPrincipal()).getId());
    }

    @Test
    public void testAuthenticateWithStrangeNameAndMissingEmail() {
        String username1 = "a@";
        AuthzAuthenticationRequest req1 = UaaAuthenticationTestFactory.getAuthenticationRequest(username1, true);
        UaaUser u1 = manager.getUser(req1, req1.getInfo());
        assertEquals(username1, u1.getUsername());

        String username2 = "@a";
        AuthzAuthenticationRequest req2 = UaaAuthenticationTestFactory.getAuthenticationRequest(username2, true);
        UaaUser u2 = manager.getUser(req2, req2.getInfo());
        assertEquals(username2, u2.getUsername());

        String username3 = "a@b@c";
        AuthzAuthenticationRequest req3 = UaaAuthenticationTestFactory.getAuthenticationRequest(username3, true);
        UaaUser u3 = manager.getUser(req3, req3.getInfo());
        assertEquals(username3, u3.getUsername());
    }

}
