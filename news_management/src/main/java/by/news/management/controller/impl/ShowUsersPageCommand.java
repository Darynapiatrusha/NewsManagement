package by.news.management.controller.impl;

import java.io.IOException;
import java.util.List;

import by.news.management.bean.User;
import by.news.management.controller.Command;
import by.news.management.service.ServiceException;
import by.news.management.service.ServiceProvider;
import by.news.management.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ShowUsersPageCommand implements Command {
	private final UserService userService = ServiceProvider.getInstance().getUserService();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		try {
			List<User> users = userService.getListOfUsers(page);
			List<Integer> numberOfPages = userService.getListOfPages();
			request.setAttribute("listOfUsers", users);
			request.setAttribute("numberOfUsersPages", numberOfPages);
			request.getSession(true).setAttribute("url", request.getRequestURI());
			request.getSession(true).setAttribute("queryString", request.getQueryString());
			request.getRequestDispatcher("WEB-INF/jsp/users.jsp").forward(request, response);

		} catch (ServiceException e) {
			response.sendRedirect("Controller?command=show_error");
		}
	}
}
