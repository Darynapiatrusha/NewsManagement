package by.news.management.service.impl;

import by.news.management.dao.DaoProvider;
import by.news.management.dao.UserDao;
import by.news.management.dao.exceptions.DAOException;
import by.news.management.dao.exceptions.UserNotFoundException;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import by.news.management.bean.News;
import by.news.management.bean.User;
import by.news.management.service.ServiceException;
import by.news.management.service.UserService;

public class UserServiceImpl implements UserService {
	private final UserDao userDao = DaoProvider.getInstance().getUserDao();
	private final static Logger log = LogManager.getRootLogger();

	@Override
	public void registation(User user) throws ServiceException {
		try {
			userDao.registration(user);
		} catch (DAOException e) {
			log.error("Error");
			throw new ServiceException("User was not registated in system", e);
		}
	}

	@Override
	public User signIn(String login, String password) throws ServiceException {
		try {
			return userDao.signIn(login, password);
		} catch (DAOException e) {
			log.error("Error of sign in process");
			throw new ServiceException("Error of sign in process, ", e);
		} catch (UserNotFoundException e) {
			log.error("Error");
			throw new ServiceException("User with this login was not found in database", e);
		}
	}

	@Override
	public List<User> getListOfUsers(int page) throws ServiceException {
		try {
			return userDao.getListOfUsers(page);

		} catch (DAOException e) {
			log.error("Error");
			throw new ServiceException("News was not selecting from database", e);
		}
	}

	@Override
	public List<Integer> getListOfPages() throws ServiceException {
		try {
			return userDao.getListOfPages();
		} catch (DAOException e) {
			log.error("Error");
			throw new ServiceException("List of pages was not found in database", e);
		}
	}
}
