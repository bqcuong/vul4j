package org.esigate.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.security.Principal;
import java.util.Collection;
import java.util.Collections;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.cookie.Cookie;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.esigate.api.HttpRequest;
import org.esigate.api.HttpSession;
import org.esigate.util.UriUtils;

public class HttpRequestImpl implements HttpRequest {

	private final HttpServletRequest parent;
	private final ServletContext servletContext;

	private HttpRequestImpl(HttpServletRequest parent, ServletContext servletContext) {
		this.parent = parent;
		this.servletContext = servletContext;
	}

	public static HttpRequest wrap(HttpServletRequest parent, ServletContext servletContext) {
		return new HttpRequestImpl(parent, servletContext);

	}

	public String getParameter(String name) {
		return parent.getParameter(name);
	}

	public String getHeader(String name) {
		return parent.getHeader(name);
	}

	@SuppressWarnings("unchecked")
	public Collection<String> getHeaderNames() {
		return Collections.<String> list(parent.getHeaderNames());
	}

	public Cookie[] getCookies() {
		javax.servlet.http.Cookie[] src = parent.getCookies();
		Cookie result[] = null;
		if (src != null) {
			result = new Cookie[src.length];
			for (int i = 0; i < src.length; i++) {
				javax.servlet.http.Cookie c = src[i];
				BasicClientCookie dest = new BasicClientCookie(c.getName(), c.getValue());
				dest.setSecure(c.getSecure());
				dest.setDomain(c.getDomain());
				dest.setPath(c.getPath());
				dest.setComment(c.getComment());
				dest.setVersion(c.getVersion());
				// if (cookie.getMaxAge() < 0) {

				result[i] = dest;
			}
		}
		return result;
	}

	public String getMethod() {
		return parent.getMethod();
	}

	public String getRemoteAddr() {
		return parent.getRemoteAddr();
	}

	public InputStream getInputStream() throws IOException {
		return parent.getInputStream();
	}

	public String getContentType() {
		return parent.getContentType();
	}

	public boolean isSecure() {
		return parent.isSecure();
	}

	public String getCharacterEncoding() {
		return parent.getCharacterEncoding();
	}

	public void setCharacterEncoding(String env) throws UnsupportedEncodingException {
		this.parent.setCharacterEncoding(env);
	}

	public String getRemoteUser() {
		return parent.getRemoteUser();
	}

	public Object getAttribute(String name) {
		return parent.getAttribute(name);
	}

	public void setAttribute(String name, Object o) {
		parent.setAttribute(name, o);
	}

	public Principal getUserPrincipal() {
		return parent.getUserPrincipal();
	}

	public HttpSession getSession(boolean create) {
		javax.servlet.http.HttpSession session = parent.getSession(create);
		return session != null ? HttpSessionImpl.wrap(session) : null;
	}

	public URI getUri() {
		return UriUtils.createURI(parent.getScheme(), parent.getServerName(), parent.getServerPort(), parent.getRequestURI(), parent.getQueryString(), null);
	}

	public InputStream getResourceAsStream(String path) {
		return servletContext.getResourceAsStream(path);
	}

}
