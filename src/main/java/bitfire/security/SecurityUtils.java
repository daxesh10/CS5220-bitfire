package bitfire.security;

import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.context.SecurityContextHolder;

import bitfire.model.User;

public class SecurityUtils {

    private static AuthenticationTrustResolver authenticationTrustResolver = new AuthenticationTrustResolverImpl();

    public static boolean isAnonymous()
    {
        return authenticationTrustResolver.isAnonymous(
            SecurityContextHolder.getContext().getAuthentication() );
    }

    public static boolean isAuthenticated()
    {
    	System.out.println("I am in isAuthenticated()");
        return !isAnonymous();
    }

    public static User getUser()
    {
    	System.out.println("I am in SecurityUtils");
        return isAuthenticated() ? (User) SecurityContextHolder.getContext()
            .getAuthentication()
            .getPrincipal() : null;
    }

}
