package com.nenu.info.common.filter;


import com.nenu.info.common.utils.WebConstants;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: software-liuwang
 * @time: 2017/11/8 19:16
 * @description :
 */
public class ConstantsFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        request.setAttribute("staticWebsite", WebConstants.staticWebSite);
        request.setAttribute("website",WebConstants.website);

        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
