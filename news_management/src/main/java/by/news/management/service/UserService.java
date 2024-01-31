package by.news.management.service;

import java.util.List;

import by.news.management.bean.User;

public interface UserService {
	public void registation(User user) throws ServiceException;
	public User signIn(String login, String password) throws ServiceException;
	List<User> getListOfUsers(int page) throws ServiceException;
	List<Integer> getListOfPages() throws ServiceException;
}
